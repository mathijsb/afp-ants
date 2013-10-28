STAGE1 = AntsBase.hs \
         AntsCompiler.hs \
         AntsParser.hs \
         AntsLexer.hs \
         Ants.hs \
         AntsPrettyPrinter.hs

STAGE2 = Assembler.hs \
         Base.hs \
         Main.hs \
         Parse.hs \
         PrettyPrint.hs \
         Test.hs

COMMON = Caching.hs \
         GamePlay.hs \
         Options.hs \
         ReadInstructions.hs \
         ReadWorld.hs \
         Simulator.hs

STAGE1_DEPS = $(patsubst %,Stage1/%,$(STAGE1))
STAGE2_DEPS = $(patsubst %,Stage2/%,$(STAGE2))
COMMON_DEPS = $(patsubst %,Common/%,$(COMMON))

gui: $(COMMON_DEPS) Ants.hs
	ghc --make -O2 Ants -o gui

ants: $(COMMON_DEPS) $(STAGE1_DEPS)
	ghc --make -main-is Stage1.Ants Stage1.Ants -o ants

afa: $(COMMON_DEPS) $(STAGE2_DEPS)
	ghc --make -main-is Stage2.Main Stage2.Main -o afa

%.afa: ants %.asl
	./ants "$*.asl" | sed '1,/Compiled/d' > "$*.afa"

%.ant: afa %.afa
	./afa "$*.afa" | (echo -n "$@: compiled, generated "; wc -l | tr -d "\n\r"; echo " instructions.")


.SILENT:

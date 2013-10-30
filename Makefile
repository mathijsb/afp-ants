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

GHC_FLAGS = --make -O2 # -auto-all -prof -rtsopts

clean:
	rm -f $(patsubst %.hs,Stage1/%.o,$(STAGE1)) $(patsubst %.hs,Stage1/%.hi,$(STAGE1))
	rm -f $(patsubst %.hs,Stage2/%.o,$(STAGE2)) $(patsubst %.hs,Stage2/%.hi,$(STAGE2))
	rm -f $(patsubst %.hs,Common/%.o,$(COMMON)) $(patsubst %.hs,Common/%.hi,$(COMMON))
	rm -f Ants.hi Ants.o
	rm -f afa ants gui

gui: $(COMMON_DEPS) Ants.hs
	ghc $(GHC_FLAGS) Ants -o $@

ants: $(COMMON_DEPS) $(STAGE1_DEPS)
	ghc $(GHC_FLAGS) -main-is Stage1.Ants Stage1.Ants -o $@

afa: $(COMMON_DEPS) $(STAGE2_DEPS)
	ghc $(GHC_FLAGS) -main-is Stage2.Main Stage2.Main -o $@

%.afa: ants %.asl
	./ants "$*.asl" | sed '1,/Compiled/d' > "$*.afa"

%.ant: afa %.afa
	./afa "$*.afa" && (cat "$*.ant" | wc -l | sed 's/.*/Compiled $@, generated \0 instructions./')

.SILENT:

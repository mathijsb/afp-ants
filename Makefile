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


ants: $(patsubst %,Stage1/%,$(STAGE1))
	ghc --make -main-is Stage1.Ants Stage1.Ants -o ants

afa: $(patsubst %,Stage2/%,$(STAGE2))
	ghc --make -main-is Stage2.Main Stage2.Main -o afa

%.afa: ants %.asl
	./ants "$*.asl" | sed '1,/Compiled/d' > "$*.afa"

%.ant: afa %.afa
	./afa "$*.afa"

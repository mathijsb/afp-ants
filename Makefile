IDE    = Main.hs \
         WXExt.hs \
         libwxext.a

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

IDE_PATH    = IDE
STAGE1_PATH = Stage1
STAGE2_PATH = Stage2
COMMON_PATH = Common

IDE_DEPS    = $(patsubst %,$(IDE_PATH)/%,$(IDE))
STAGE1_DEPS = $(patsubst %,$(STAGE1_PATH)/%,$(STAGE1))
STAGE2_DEPS = $(patsubst %,$(STAGE2_PATH)/%,$(STAGE2))
COMMON_DEPS = $(patsubst %,$(COMMON_PATH)/%,$(COMMON))

GHC_FLAGS = --make -O2

clean:
	rm -f $(patsubst %.hs,$(STAGE1_PATH)/%.o,$(STAGE1)) $(patsubst %.hs,$(STAGE1_PATH)/%.hi,$(STAGE1))
	rm -f $(patsubst %.hs,$(STAGE2_PATH)/%.o,$(STAGE2)) $(patsubst %.hs,$(STAGE2_PATH)/%.hi,$(STAGE2))
	rm -f $(patsubst %.hs,$(COMMON_PATH)/%.o,$(COMMON)) $(patsubst %.hs,$(COMMON_PATH)/%.hi,$(COMMON))
	rm -f $(patsubst %.hs,$(IDE_PATH)/%.o,$(IDE)) $(patsubst %.hs,$(IDE_PATH)/%.hi,$(IDE))
	rm -f $(IDE_PATH)/libwxext.a $(IDE_PATH)/wxext.o
	rm -f Ants.hi Ants.o
	rm -f afa ants gui editor

%/libwxext.a: %/wxext.o
	ar rcs "$*/libwxext.a" "$*/wxext.o"

%/wxext.o: %/wxext.c
	g++ `wx-config --cflags` -c -Wall -Werror -fpic -o "$*/wxext.o" "$*/wxext.c"

editor: $(IDE_DEPS)
	ghc $(GHC_FLAGS) -main-is IDE.Main -lstdc++ $(IDE_PATH)/libwxext.a $(IDE_PATH)/Main.hs -o $@

sim: $(COMMON_DEPS) Ants.hs
	ghc $(GHC_FLAGS) Ants -o $@

ants: $(COMMON_DEPS) $(STAGE1_DEPS)
	ghc $(GHC_FLAGS) -main-is Stage1.Ants $(STAGE1_PATH)/Ants.hs -o $@

afa: $(COMMON_DEPS) $(STAGE2_DEPS)
	ghc $(GHC_FLAGS) -main-is Stage2.Main $(STAGE2_PATH)/Main.hs -o $@

%.afa: ants %.asl
	./ants "$*.asl" | sed '1,/Compiled/d' > "$*.afa"

%.ant: afa %.afa
	./afa "$*.afa" && (cat "$*.ant" | wc -l | sed 's/.*/Compiled $@, generated \0 instructions./')


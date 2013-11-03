IDE    = Main.hs \
         WXExt.hs \
         libwxcext.a

SIM    = Main.hs

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
SIM_PATH    = Simulator

IDE_DEPS    = $(patsubst %,$(IDE_PATH)/%,$(IDE))
STAGE1_DEPS = $(patsubst %,$(STAGE1_PATH)/%,$(STAGE1))
STAGE2_DEPS = $(patsubst %,$(STAGE2_PATH)/%,$(STAGE2))
COMMON_DEPS = $(patsubst %,$(COMMON_PATH)/%,$(COMMON))
SIM_DEPS    = $(patsubst %,$(SIM_PATH)/%,$(SIM))

GHC_FLAGS    = --make -O2
WX_CXX_FLAGS = `wx-config --version=2.9 --cxxflags`

clean:
	rm -f $(patsubst %.hs,$(STAGE1_PATH)/%.o,$(STAGE1)) $(patsubst %.hs,$(STAGE1_PATH)/%.hi,$(STAGE1))
	rm -f $(patsubst %.hs,$(STAGE2_PATH)/%.o,$(STAGE2)) $(patsubst %.hs,$(STAGE2_PATH)/%.hi,$(STAGE2))
	rm -f $(patsubst %.hs,$(COMMON_PATH)/%.o,$(COMMON)) $(patsubst %.hs,$(COMMON_PATH)/%.hi,$(COMMON))
	rm -f $(patsubst %.hs,$(SIM_PATH)/%.o,$(SIM)) $(patsubst %.hs,$(SIM_PATH)/%.hi,$(SIM))
	rm -f $(patsubst %.hs,$(IDE_PATH)/%.o,$(IDE)) $(patsubst %.hs,$(IDE_PATH)/%.hi,$(IDE))
	rm -f $(IDE_PATH)/libwxcext.a $(IDE_PATH)/wxcext.o
	rm -f afa asc sim editor

%/libwxcext.a: %/wxcext.o
	ar rcs "$@" "$*/wxcext.o"

%/wxcext.o: %/wxcext.cpp
	g++ $(WX_CXX_FLAGS) -c -Wall -Werror -fpic -o "$@" "$*/wxcext.cpp"

editor: $(IDE_DEPS) $(STAGE1_DEPS) $(STAGE2_DEPS)
	ghc $(GHC_FLAGS) -main-is IDE.Main -optl $(IDE_PATH)/libwxcext.a -optl-lstdc++ $(IDE_PATH)/Main.hs -o $@

sim: $(COMMON_DEPS) $(SIM_DEPS)
	ghc $(GHC_FLAGS) Ants -o $@

asc: $(COMMON_DEPS) $(STAGE1_DEPS)
	ghc $(GHC_FLAGS) -main-is Stage1.Ants $(STAGE1_PATH)/Ants.hs -o $@

afa: $(COMMON_DEPS) $(STAGE2_DEPS)
	ghc $(GHC_FLAGS) -main-is Stage2.Main $(STAGE2_PATH)/Main.hs -o $@

%.afa: asc %.asl
	./asc "$*.asl" | sed '1,/Compiled/d' > "$*.afa"

%.ant: afa %.afa
	./afa "$*.afa" && (cat "$*.ant" | wc -l | sed 's/.*/Compiled $@, generated \0 instructions./')


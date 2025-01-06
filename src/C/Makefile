.SUFFIXES:
.PHONY: all main clean

# making sure devkitARM exists and is set up
ifeq ($(strip $(DEVKITARM)),)
	$(error "Please set DEVKITARM in your environment. export DEVKITARM=<path to>devkitARM")
endif

# including devkitARM tool definitions
include $(DEVKITARM)/base_tools

# defining path of lyn
LYN := $ C:/devkitPro/lyn.exe

# Setting C/ASM include directories up (there is none yet)
INCLUDE_DIRS := C:/FE-CLib/include
INCFLAGS     := $(foreach dir, $(INCLUDE_DIRS), -I "$(dir)")

# Setting up compilation flags.
# We're using -O2 instead of -Os because of this missing library function:
# __gnu_thumb1_case_uqi
# being called when switch statements get 4 or more cases. Solution provided here:
# https://discord.com/channels/144670830150811649/179027738454261760/993219676131835924
# Here's another person working on a TI machine (calculator?) with the same problem:
# https://e2e.ti.com/support/microcontrollers/arm-based-microcontrollers-group/arm-based-microcontrollers/f/arm-based-microcontrollers-forum/1367312/mspm0g3507-undefined-__gnu_thumb1_case_uhi-when-building-with-ti_arm_clang-and-linking-to-precombiled-library-built-with-gnu-toolchain
# Answer also suggests switch statement optimisation being culpable.
ARCH   := -mcpu=arm7tdmi -mthumb -mthumb-interwork
CFLAGS := $(ARCH)$(INCFLAGS) -Wall -O2 -mtune=arm7tdmi -mlong-calls

# lyn reference object
LYNREF := C:/FE-CLib/reference/FE8U.o

# listing files
CFILEMAIN := main.c
SFILEMAIN := main.s
OFILEMAIN := $(CFILEMAIN:.c=.o) $(SFILEMAIN:.asm=.o)
LYNFILEMAIN := $(OFILEMAIN:.o=.lyn.event)
DMPFILEMAIN := $(OFILEMAIN:.o=.dmp)

CFILES := $(wildcard *.c)
SFILES := $(wildcard *.asm)
OFILES := $(CFILES:.c=.o) $(SFILES:.asm=.o)
ASMFILES := $(CFILES:.c=.s)
LYNFILES := $(OFILES:.o=.lyn.event)
DMPFILES := $(OFILES:.o=.dmp)

# defining & making dependency directory
DEPSDIR := .MkDeps
$(shell mkdir -p $(DEPSDIR) > /dev/null)

# listing possible dependency files
DEPFILES := $(addprefix $(DEPSDIR)/, $(notdir $(CFILES:.c=.d)))

# dependency generation flags for CC
CDEPFLAGS = -MD -MT $*.o -MT $*.s -MF $(DEPSDIR)/$(notdir $*).d -MP

# "make all" phony targets
all: $(OFILES) $(ASMFILES) $(LYNFILES) $(DMPFILES);

# make main only.
main: $(OFILEMAIN) $(SFILEMAIN) $(LYNFILEMAIN) $(DMPFILEMAIN);

# "Clean" target
clean:
	rm -f $(OFILES) $(ASMFILES) $(LYNFILES) $(DMPFILES) $(DEPFILES)

# C to ASM rule
%.s: %.c
	$(CC) $(CFLAGS) $(CDEPFLAGS) -S $< -o $@

# C to OBJ rule
%.o: %.c
	$(CC) $(CFLAGS) $(CDEPFLAGS) -c $< -o $@

# ASM to OBJ rule
%.o: %.asm
	$(AS) $(ARCH) $< -o $@

# OBJ to DMP rule
%.dmp: %.o
	$(OBJCOPY) -S $< -O binary $@

# OBJ to EVENT rule
%.lyn.event: %.o $(LYNREF)
	$(LYN) $< $(LYNREF) > $@

# Including generated dependency rules
-include $(DEPFILES)
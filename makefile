AS = as
LD = ld
OBJCOPY = objcopy
ASFLAGS = 
LDFLAGS_OAM = -T linker_script_oam.ld
LDFLAGS_SCRIPT = -T linker_script_script.ld
OBJCOPYFLAGS = -O binary

OBJ = data.o

ELF_OAM = output_oam.elf
ELF_SCRIPT = output_script.elf

BIN_OAM = output_oam.bin
BIN_SCRIPT = output_script.bin

all: $(BIN_OAM) $(BIN_SCRIPT)
	xxd $(BIN_OAM)
	xxd $(BIN_SCRIPT)

$(ELF_OAM): $(OBJ)
	$(LD) $(LDFLAGS_OAM) -o $@ $(OBJ)

$(ELF_SCRIPT): $(OBJ)
	$(LD) $(LDFLAGS_SCRIPT) -o $@ $(OBJ)

$(BIN_OAM): $(ELF_OAM)
	$(OBJCOPY) --only-section=.data.oam $(OBJCOPYFLAGS) $< $@

$(BIN_SCRIPT): $(ELF_SCRIPT)
	$(OBJCOPY) --only-section=.data.script $(OBJCOPYFLAGS) $< $@

$(OBJ): data.s
	$(AS) $(ASFLAGS) -o $@ $<

clean:
	rm -f $(OBJ) $(ELF_OAM) $(ELF_SCRIPT) $(BIN_OAM) $(BIN_SCRIPT)

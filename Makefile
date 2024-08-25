.DELETE_ON_ERROR:

AS = wla-6502
LD = wlalink

ASM = hack.asm
OBJ = hack.o
OUTPUT_ROM = hack.nes
LINKFILE = linkfile

$(OUTPUT_ROM): $(OBJ) $(LINKFILE)
	$(LD) $(LINKFILE) $@

$(OBJ): $(ASM)
	$(AS) -o $@ $<

$(LINKFILE):
	printf "[objects]\n%s" "$(OBJ)" > $@

.PHONY:
clean:
	rm -rf $(OBJ) $(OUTPUT_ROM) $(LINKFILE)

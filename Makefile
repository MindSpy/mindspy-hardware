
.PHONY: all clean
.DEFAULT: all

BOARD=mindspy.brd
EAGLE=eagle

TOP=Top Pads Vias
BOTTOM=Bottom Pads Vias
TMASK=tStop
BMASK=bStop
TTEXT=Document
DRILL=Drills Holes Reference
MILL=Milling

OUT_DIR=out
GBR_FILES=bot.gbr top.gbr smb.gbr smt.gbr plt.gbr mill.gbr pth.exc
OUT_FILES=$(GBR_FILES:%=$(OUT_DIR)/%)


all: gbr.zip

clean:
	rm -frv $(OUT_DIR)/  *#* 

$(OUT_DIR):
	mkdir $(OUT_DIR)

gbr.zip: $(OUT_FILES)
	zip -D $@ $(OUT_FILES)

$(OUT_DIR)/bot.gbr: $(OUT_DIR)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$@ $(BOARD) $(BOTTOM)
$(OUT_DIR)/top.gbr: $(OUT_DIR)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$@ $(BOARD) $(TOP)
$(OUT_DIR)/smb.gbr: $(OUT_DIR)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$@ $(BOARD) $(BMASK)
$(OUT_DIR)/smt.gbr: $(OUT_DIR)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$@ $(BOARD) $(TMASK)
$(OUT_DIR)/plt.gbr: $(OUT_DIR)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$@ $(BOARD) $(TTEXT)
$(OUT_DIR)/pth.exc: $(OUT_DIR)
	$(EAGLE) -X -dEXCELLON -s1 -c+ -O+ -o$@ $(BOARD) $(DRILL)
$(OUT_DIR)/mill.gbr: $(OUT_DIR)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$@ $(BOARD) $(MILL)


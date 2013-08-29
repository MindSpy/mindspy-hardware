

BOARD=mindspy.brd
EAGLE=eagle

TOP=Top Pads Vias
BOTTOM=Bottom Pads Vias
TMASK=tStop
BMASK=bStop
TTEXT=Dimension Document
DRILL=Drills Holes Reference
MILL=Dimension

OUT=out

all: gbr

clean:
	rm -frv $(OUT)/  *#*

$(OUT):
	mkdir $(OUT)


gbr: $(OUT) bot.gbr top.gbr smb.gbr smt.gbr plt.gbr pth.exc mill.gbr

bot.gbr: $(OUT)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$(OUT)/$@ $(BOARD) $(BOTTOM)
top.gbr: $(OUT)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$(OUT)/$@ $(BOARD) $(TOP)
smb.gbr: $(OUT)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$(OUT)/$@ $(BOARD) $(BMASK)
smt.gbr: $(OUT)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$(OUT)/$@ $(BOARD) $(TMASK)
plt.gbr: $(OUT)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$(OUT)/$@ $(BOARD) $(TTEXT)
pth.exc: $(OUT)
	$(EAGLE) -X -dEXCELLON -s1 -c+ -O+ -o$(OUT)/$@ $(BOARD) $(DRILL)
mill.gbr: $(OUT)
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -o$(OUT)/$@ $(BOARD) $(MILL)


eps: $(OUT) bot.eps top.eps smb.eps smt.eps plt.eps pth.eps mill.eps

bot.eps: $(OUT)
	$(EAGLE) -X -dEPS -s1 -f- -o$(OUT)/$@ $(BOARD) $(BOTTOM)
top.eps: $(OUT)
	$(EAGLE) -X -dEPS -s1 -f- -o$(OUT)/$@ $(BOARD) $(TOP)
smb.eps: $(OUT)
	$(EAGLE) -X -dEPS -s1 -f- -o$(OUT)/$@ $(BOARD) $(BMASK)
smt.eps: $(OUT)
	$(EAGLE) -X -dEPS -s2 -f- -o$(OUT)/$@ $(BOARD) $(TMASK)
plt.eps: $(OUT)
	$(EAGLE) -X -dEPS -s1 -f- -o$(OUT)/$@ $(BOARD) $(TTEXT)
pth.eps: $(OUT)
	$(EAGLE) -X -dEPS -s1 -f- -o$(OUT)/$@ $(BOARD) $(DRILL)
mill.eps: $(OUT)
	$(EAGLE) -X -dEPS -s1 -f- -o$(OUT)/$@ $(BOARD) $(MILL)
	

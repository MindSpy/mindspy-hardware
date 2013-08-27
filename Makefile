

BOARD=mindspy.brd
EAGLE=eagle

TOP=Top Pads Vias
BOTTOM=Bottom Pads Vias
TMASK=tStop
BMASK=bStop
TTEXT=Dimension Document
DRILL=Drills Holes
MILL=Dimension

all: gbr

clean:
	rm -fr out/  *#*

out:
	mkdir out


gbr: out bot.gbr top.gbr smb.gbr smt.gbr plt.gbr pth.exc mill.gbr

bot.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) $(BOTTOM)
top.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) $(TOP)
smb.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) $(BMASK)
smt.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) $(TMASK)
plt.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) $(TTEXT)
pth.exc: out
	$(EAGLE) -X -dEXCELLON -s1 -c+ -O+ -oout/$@ $(BOARD) $(DRILL)
mill.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) $(MILL)


eps: out bot.eps top.eps smb.eps smt.eps plt.eps pth.eps mill.eps

bot.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) $(BOTTOM)
top.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) $(TOP)
smb.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) $(BMASK)
smt.eps: out
	$(EAGLE) -X -dEPS -s2 -f- -oout/$@ $(BOARD) $(TMASK)
plt.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) $(TTEXT)
pth.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) $(DRILL)
mill.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) $(MILL)
	

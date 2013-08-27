

BOARD=mindspy.brd
EAGLE=eagle

all: gbr

clean:
	rm -fr out/  *#*

out:
	mkdir out

gbr: out bot.gbr top.gbr smb.gbr smt.gbr plt.gbr pth.exc mill.gbr

bot.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) Bottom Pads Vias
top.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) Top Pads Vias
smb.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) bStop
smt.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) tStop
plt.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) Dimension Document
pth.exc: out
	$(EAGLE) -X -dEXCELLON -s1 -c+ -O+ -oout/$@ $(BOARD) Drills Holes Reference
mill.gbr: out
	$(EAGLE) -X -dGERBER_RS274X -s1 -c+ -O+ -oout/$@ $(BOARD) Dimension


eps: out bot.eps top.eps smb.eps smt.eps plt.eps pth.eps mill.eps

bot.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) Bottom Pads Vias
top.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) Top Pads Vias
smb.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) bStop
smt.eps: out
	$(EAGLE) -X -dEPS -s2 -f- -oout/$@ $(BOARD) tStop
plt.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) Dimension Document
pth.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) Drills Holes Reference
mill.eps: out
	$(EAGLE) -X -dEPS -s1 -f- -oout/$@ $(BOARD) Dimension
	

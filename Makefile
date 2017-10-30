build: snesdtb_1.0-2.deb snes_rules
	$(MAKE) -C source

snesdtb_1.0-2.deb:
	wget https://github.com/nArnoSNES/snesdtb/releases/download/v1.0-2/snesdtb_1.0-2.deb
	sudo dpkg -i snesdtb_1.0-2.deb

snes_rules:
	cp -R ./pvsneslib/devkitsnes/include .
	cp -R ./pvsneslib/pvsneslib/include .
	cp -R ./pvsneslib/pvsneslib/source .
	cp ./custom/Makefile ./source
	cp ./custom/snes_rules .
	mkdir lib 

clean:
	- rm -f snesdtb_1.0-2.deb
	- rm -rf include source snes_rules lib

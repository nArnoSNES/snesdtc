pvsl: pvsneslib.tgz
	cat decompress pvsneslib.tgz > pvsl
	chmod +x pvsl

pvsneslib.tgz: build
	tar czvf pvsneslib.tgz lib include snes_rules

build: snesdtb_1.0-4.deb snes_rules
	$(MAKE) -C source

snesdtb_1.0-4.deb:
	wget https://github.com/nArnoSNES/snesdtb/releases/download/v1.0-4/snesdtb_1.0-4.deb
	sudo dpkg -i snesdtb_1.0-4.deb

snes_rules:
	cp -R ./pvsneslib/devkitsnes/include .
	cp -R ./pvsneslib/pvsneslib/include .
	cp -R ./pvsneslib/pvsneslib/source .
	cp ./custom/Makefile ./source
	cp ./custom/snes_rules .
	mkdir lib 

clean:
	- rm -rf include source snes_rules lib
	- rm pvsneslib.tgz pvsl

distclean: clean
	- rm -f snesdtb_1.0-4.deb

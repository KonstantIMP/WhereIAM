MAGICK := "magick"

CITIES :=
CITIES += build/city/msk.png
CITIES += build/city/spb.png

IATAS :=
IATAS += build/iata/dmo.png
IATAS += build/iata/goj.png
IATAS += build/iata/iar.png
IATAS += build/iata/kmw.png
IATAS += build/iata/led.png
IATAS += build/iata/mrv.png
IATAS += build/iata/nal.png
IATAS += build/iata/nov.png
IATAS += build/iata/svo.png
IATAS += build/iata/vko.png
IATAS += build/iata/vvo.png

all: city iata

.PHONY: city
city: build/city.zip

build/city.zip: build/city $(CITIES)
	zip -j $@ $</*.png

.PHONY: iata
iata: build/iata.zip

build/iata.zip: build/iata $(IATAS)
	zip -j $@ $</*.png

build/%.png: %.psd
	$(MAGICK) "$<[0]" -alpha activate -background transparent -size 100x100 -quality 100 $@

build/city: build
	mkdir $@

build/iata: build
	mkdir $@

build:
	mkdir build

.PHONY: clean
clean:
	rm -rf build

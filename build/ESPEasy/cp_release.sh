#!/bin/bash
set -e

my_pfad="ESPEasy"


echo "Creating release from $my_pfad"


############## update Release_notes.txt
NOTES="releases/Release_notes.txt"
echo "-------------------------------------------------" > "$NOTES.new"
echo "Neues Release wurde erzeugt" >> "$NOTES.new"
echo "Release ist für $my_pfad"
echo "-------------------------------------------------" >> "$NOTES.new"
echo -e "\nRelease date: `date`\n" >> "$NOTES.new"


echo >> "$NOTES.new"
cat "$NOTES" >> "$NOTES.new"
mv "$NOTES.new" "$NOTES"
cd $my_pfad
pwd
if [ -f ".pio/build/dev_ESP8266_4M1M/firmware.bin" ]
then
	mv .pio/build/dev_ESP8266_4M1M/firmware.bin ../releases/`date '+%Y%m%d%H%M%S'`_dev_ESP8266_4096.bin
else
	echo "No Devel-Firmware"	
	echo ".pio/build/dev_ESP8266_4M1/firmware.bin not found"
	echo "No Devel-Firmware"
fi

if [ -f ".pio/build/normal_ESP8266_4M1M/firmware.bin" ]
then
  cp .pio/build/normal_ESP8266_4M1M/firmware.bin ../releases/openandhome_devel.bin
  mv .pio/build/normal_ESP8266_4M1M/firmware.bin ../releases/`date '+%Y%m%d%H%M%S'`_normal_ESP8266_4096.bin
else
	echo "No Normal-Firmware"	
	echo ".pio/build/normal_ESP8266_4M1M/firmware.bin not found"
	echo "No Normal-Firmware"	
fi

cd ../releases
ls -lrtah ./
echo
echo "The current Normal-Release can be flashed via flash_espstable"
echo

#!/bin/bash
set -e
#NEW="$1"


#[ "$NEW" != "" ] || exit 1

echo "Creating release"


############## update Release_notes.txt
NOTES="releases/Release_notes.txt"
echo "-------------------------------------------------" > "$NOTES.new"
echo "Neues Release wurde erzeugt" >> "$NOTES.new"
echo "-------------------------------------------------" >> "$NOTES.new"
echo -e "\nRelease date: `date`\n" >> "$NOTES.new"


echo >> "$NOTES.new"
cat "$NOTES" >> "$NOTES.new"
mv "$NOTES.new" "$NOTES"

if [ -f "Sonoff-Tasmota/.pioenvs/sonoff-DE/firmware.bin" ]
then
	cp Sonoff-Tasmota/.pioenvs/sonoff-DE/firmware.bin releases/sonoff-openandhome.bin
	mv Sonoff-Tasmota/.pioenvs/sonoff-DE/firmware.bin releases/`date '+%Y%m%d%H%M%S'`_sonoff-de.bin
else
	echo "Sonoff-Tasmota/.pioenvs/sonoff-DE/firmware.bin nicht gefunden"
fi

ls -lrtah releases
cd releases
echo
echo "Das aktuelle Release kann mittels flashsonoff geflashed werden"
echo

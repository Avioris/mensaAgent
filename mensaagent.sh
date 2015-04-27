#!/bin/bash
#insert a path for a sound file
BEEP=/home/tj/Dokumente/mensaagent/nomnom.wav

mealplan=$(curl --silent http://www.studentenwerk-berlin.de/mensen/speiseplan/fu2/)

#read meals
while read meal 
do
	echo $mealplan | grep "$meal" > /dev/null
	if [ $? = '0' ]; then
		#message
		echo "message: MensaAgent\n"$meal| zenity --notification --listen --timeout 1
		paplay $BEEP
	fi
done < ~/Dokumente/mensaagent/meals.txt








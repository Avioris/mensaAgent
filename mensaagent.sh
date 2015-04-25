#!/bin/bash

BEEP=/usr/share/sounds/ubuntu/stereo/phone-incoming-call.ogg

mealplan=$(curl --silent http://www.studentenwerk-berlin.de/mensen/speiseplan/fu2/01.html)

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








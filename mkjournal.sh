#!/bin/sh
clear
cd ~/Documents/
JournalsFolder=~/Documents/Journals
dateOfJournal=`date +%dth\ of\ %b,\ %Y`
timeOfDay=`date +%I:%M\ %p`
newJournal="$dateOfJournal.txt"
JournalMaker() {
    #editor=$1
    cd $JournalsFolder
    echo "opening today's journal..."
    sleep 1s
    touch "$newJournal"
    if hash nano 2>/dev/null
    then
        echo "$timeOfDay" >> "$newJournal"
        nano "$newJournal"
    else
        echo "$timeOfDay" >> "$newJournal"
        gnome-text-editor "$newJournal"
    fi  
}
if [ -e ".O3jn26sJYPF20dMxkvd98fxTdYI" ] && [ -d $JournalsFolder ]
then 
    echo "Welcome back!"
    JournalMaker
elif [ ! -d $JournalsFolder ] && [ -e ".O3jn26sJYPF20dMxkvd98fxTdYI" ]
then 
    echo 'Journals Folder is missing, creating Journals Folder...']
    mkdir $JournalsFolder
    echo 'Created successfully...'
    JournalMaker
elif [ ! -e ".O3jn26sJYPF20dMxkvd98fxTdYI" ] && [ -d $JournalsFolder ]
then 
    touch ".O3jn26sJYPF20dMxkvd98fxTdYI"
    chmod 000 ".O3jn26sJYPF20dMxkvd98fxTdYI"
    JournalMaker
else 
    ####intro to the app
    echo "Hello there"
    sleep 1s
    echo "This is a comand line tool that will help you write your journals."
    sleep 1s
    echo 'all your journals are going to be in $JournalsFolder/ folder that will be created' 
    touch ".O3jn26sJYPF20dMxkvd98fxTdYI"
    chmod 000 ".O3jn26sJYPF20dMxkvd98fxTdYI"d
    echo 'Creating the journals folder...'
    sleep 1s
    mkdir $JournalsFolder
    echo 'created successfully'
    ####program starts
    JournalMaker
fi
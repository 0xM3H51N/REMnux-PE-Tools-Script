#!/bin/bash


echo "Will take a minute..."

exe=$1
dir="Pe-Anlysis"

if [ ! -d "$dir" ]; then
        mkdir $dir
fi


if [ ! -d "$dir/$exe" ]; then
	mkdir $dir/$exe
fi

if [ ! -d "$dir/$exe/file_command" ]; then
        mkdir $dir/$exe/file_command
fi

if [ ! -d "$dir/$exe/strings" ]; then
        mkdir $dir/$exe/strings
fi

if [ ! -d "$dir/$exe/manalyze" ]; then
        mkdir $dir/$exe/manalyze
fi

if [ ! -d "$dir/$exe/peframe" ]; then
        mkdir $dir/$exe/peframe
fi

if [ ! -d "$dir/$exe/dllcaharcteristics" ]; then
        mkdir $dir/$exe/dllcaharcteristics
fi

if [ ! -d "$dir/$exe/pedump" ];then
        mkdir $dir/$exe/pedump
fi

if [ ! -d "$dir/$exe/pehash" ];then
        mkdir $dir/$exe/pehash
fi

if [ ! -d "$dir/$exe/portex" ];then
        mkdir $dir/$exe/portex
fi

if [ ! -d "$dir/$exe/pesec" ];then
        mkdir $dir/$exe/pesec
fi

file $exe  >>  $dir/$exe/file_command/file_command.txt
echo "10%"
strings $exe >> $dir/$exe/strings/strings.txt
echo "20%"
manalyze $exe -d all -o 'raw' >> $dir/$exe/manalyze/manalyze.raw
echo "30%"
manalyze $exe -d all -o 'json' >> $dir/$exe/manalyze/manalyze.json
echo "40%"
peframe  $exe >> $dir/$exe/peframe/peframe.txt
echo "50%"
dllcharacteristics.py $exe >> $dir/$exe/dllcaharcteristics/dllcaharcteristics.txt
echo "60%"
pedump --all $exe >> $dir/$exe/pedump/pedump.txt
echo "70%"
pehash -a $exe >> $dir/$exe/pehash/pehash.txt
echo "80%"
portex --all  $exe >> $dir/$exe/portex/portex.txt
echo "90%"
pesec $exe >> $dir/$exe/pesec/pesec.txt
echo "100%"


echo  "All resutls in Pe-Anlysis directory"



#!/bin/bash
dr=$1
if [ -d $dr ]
    then echo "Yes, dir exist"
    else echo "No, dir not exist"
	 exit 2
fi


bak=$(ls $dr | grep .bak$ | wc -l)

if [ $bak != 0 ]
    then cd $dr && rm -rf *.bak && echo "deleted $bak .bak files"
    else echo "file .bak not found"
         
fi	   

tmp=$(ls $dr | grep .tmp$ | wc -l)

if [ $tmp != 0 ]
    then cd $dr && rm -rf *.tmp && echo "deleted $tmp .tmp files"
    else echo "file .tmp not found "
         
fi


backup=$(ls $dr | grep .backup$ | wc -l)

if [ $backup != 0 ]
    then cd $dr && rm -rf *.backup && echo "deleted $backup .backup files"
    else echo "file .backup not found "
         
fi

#!/bin/sh
###$1=yyyymmdd
###$2=North or South

check=`expr length ${1}`

if [ ${check} != 8 -o ${2} != "N" -a ${2} != "S" ]; then
	echo "ERROR"
	echo "Use Guide [sh get_image.sh yyyymmdd N(or S)]"
	echo "For example, if you want to get a Arctic data, please enter 'N'."
	exit
fi 

yyyy=`echo $1 | cut -c -4`
m=`echo $1 | cut -c 5-6`
mm=`date -d"${m}/1" +%b`
dd=`echo $1 | cut -c 7-8`
base=ftp://sidads.colorado.edu/DATASETS/NOAA/G02135
daily=daily/images/$yyyy

if [ ${2} = "N" ]; then
	wget ${base}/north/${daily}/${m}_${mm}/${2}_${1}_conc_blmrbl_hires_v3.0.png
	eog ${2}_${1}_conc_blmrbl_hires_v3.0.png
elif [ ${2} = "S" ]; then 
	wget ${base}/south/${daily}/${m}_${mm}/${2}_${1}_conc_blmrbl_hires_v3.0.png
	eog ${2}_${1}_conc_blmrbl_hires_v3.0.png
fi


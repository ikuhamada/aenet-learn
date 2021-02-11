#!/bin/sh

etot1=`grep 'Total energy' ../04-predict/monomer/predict.out | head -1 | awk '{print $4}'`
etot2=`grep 'Total energy' ../04-predict/monomer/predict.out | tail -1 | awk '{print $4}'`

etot_list=`grep 'Total energy' ./predict.out | awk '{print $4}'`

for etot in $etot_list
do

eint=`echo "scale=12; $etot - $etot1 - $etot2" | bc`

echo $eint

done

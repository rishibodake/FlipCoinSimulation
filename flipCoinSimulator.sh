#!/bin/bash -x
#Discription:Flip Coin Simulator as per use cases
#Author:Hrishikesh M Bodake
#Since:March 6 2020 / Friday
isHead=1
flips=0
flipCoinResult=O
declare -A singletCombinations
singletCombinations=(["H"]=0 ["T"]=0)
function flipCoin(){
	if [[ $((RANDOM%2)) -eq $isHead ]]
	then
		flipCoinResult="H"
	else
		flipCoinResult="T"
	fi
}
function genrateSingletCombinations(){
	while [[ $flips -lt 10 ]]
	do
		flipCoin
		if [[	$flipCoinResult == "H" ]]
		then
			singletCombinations[H]=$((${singletCombinations[H]}+1))
		elif [[ $flipCoinResult == "T" ]]
		then
			singletCombinations[T]=$((${singletCombinations[T]}+1))
		fi
			((flips++))
	done
	headPercentage=`expr "scale=2;(${singletCombinations[H]}*100)/$flips" | bc -l`
	tailPercentage=`expr "scale=2;(${singletCombinations[T]}*100)/$flips" | bc -l`
}
genrateSingletCombinations

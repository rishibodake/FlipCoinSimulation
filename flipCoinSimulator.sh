#!/bin/bash -x
#Discription:Flip Coin Simulator as per use cases
#Author:Hrishikesh M Bodake
#Since:March 6 2020 / Friday
isHead=1
loopRunner=0
flips=10
flipCoinResult=O
#doubletResult=" "
declare -A singletCombinations
declare -A doubletCombinations

singletCombinations=(["H"]=0 ["T"]=0)
doubletCombinations=(["HH"]=0 ["TT"]=0 ["TH"]=0 ["HT"]=0 )
function flipCoin(){
	if [[ $((RANDOM%2)) -eq $isHead ]]
	then
		flipCoinResult=H
	else
		flipCoinResult=T
	fi
}
function genrateSingletCombinations(){
	while [[ $loopRunner -lt $flips ]]
	do
		flipCoin
		if [[	$flipCoinResult == H ]]
		then
			singletCombinations[H]=$((${singletCombinations[H]}+1))
		elif [[ $flipCoinResult == T ]]
		then
			singletCombinations[T]=$((${singletCombinations[T]}+1))
		fi
			((loopRunner++))
	done
	headPercentage=`expr "scale=2;(${singletCombinations[H]}*100)/$flips" | bc -l`
	tailPercentage=`expr "scale=2;(${singletCombinations[T]}*100)/$flips" | bc -l`
}
function genrateDoubletCombinations(){
	while [[ $loopRunner -lt $flips ]]
	do
		flipCoin
		temp1=$flipCoinResult
		flipCoin
		temp2=$flipCoinResult
		if [[ $temp1$temp2 == HH ]]
		then
			doubletCombinations[HH]=$((${doubletCombinations[HH]}+1))
		elif [[ $temp1$temp2 == TT ]]
		then
			doubletCombinations[TT]=$((${doubletCombinations[TT]}+1))
		elif [[ $temp1$temp2 == TH ]]
		then
			doubletCombinations[TH]=$((${doubletCombinations[TH]}+1))
		elif [[ $temp1$temp2 == HT ]]
		then
			doubletCombinations[HT]=$((${doubletCombinations[HT]}+1))
		fi
		((loopRunner++))
	done
	hHPercentage=`expr "scale=2;(${doubletCombinations[HH]}*100)/$flips" | bc -l`
	tTPercentage=`expr "scale=2;(${doubletCombinations[TT]}*100)/$flips" | bc -l`
	hTPercentage=`expr "scale=2;(${doubletCombinations[HT]}*100)/$flips" | bc -l`
	tHPercentage=`expr "scale=2;(${doubletCombinations[TH]}*100)/$flips" | bc -l`
}

#genrateSingletCombinations
genrateDoubletCombinations

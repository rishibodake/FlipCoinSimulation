#!/bin/bash -x
#Discription:Flip Coin Simulator as per use cases
#Author:Hrishikesh M Bodake
#Since:March 6 2020 / Friday
isHead=1
loopRunner=0
flips=10
flipCoinResult=O
declare -A singletCombinations
declare -A doubletCombinations
declare -A tripletCombinations
singletCombinations=(["H"]=0 ["T"]=0)
doubletCombinations=(["HH"]=0 ["TT"]=0 ["TH"]=0 ["HT"]=0)
tripletCombinations=(["HHH"]=0 ["TTT"]=0 ["THT"]=0 ["HTH"]=0 ["TTH"]=0 ["HTT"]=0 ["HHT"]=0 ["THH"]=0)
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
function genrateTripletCombination(){
	while [[ $loopRunner -lt $flips ]]
	do
		flipCoin
		temp1=$flipCoinResult
		flipCoin
		temp2=$flipCoinResult
		flipCoin
		temp3=$flipCoinResult
		if [[ $temp1$temp2$temp3 == HHH ]]
		then
			tripletCombinations[HHH]=$((${tripletCombinations[HHH]}+1))
		elif [[ $temp1$temp2$temp3 == TTT ]]
		then
			tripletCombinations[TTT]=$((${tripletCombinations[TTT]}+1))
		elif [[ $temp1$temp2$temp3 == THT ]]
		then
			tripletCombinations[THT]=$((${trepletCombinations[THT]}+1))
		elif [[ $temp1$temp2$temp3 == HTH ]]
		then
			tripletCombinations[HTH]=$((${tripletCombinations[HTH]}+1))
		elif [[ $temp1$temp2$temp3 == TTH ]]
		then
			tripletCombinations[TTH]=$((${tripletCombinations[TTH]}+1))
		elif [[ $temp1$temp2$temp3 == HTT ]]
		then
			tripletCombinations[HTT]=$((${tripletCombinations[HTT]}+1))
		elif [[ $temp1$temp2$temp3 == HHT ]]
		then
			tripletCombinations[HHT]=$((${tripletCombinations[HHT]}+1))
		elif [[ $temp1$temp2$temp3 == THH ]]
      then
         tripletCombinations[THH]=$((${tripletCombinations[THH]}+1))
		fi
	((loopRunner++))
done
	HHHper=`expr "scale=2;(${tripletCombinations[HHH]}*100)/$flips" | bc -l`
	TTTper=`expr "scale=2;(${tripletCombinations[TTT]}*100)/$flips" | bc -l`
	THTper=`expr "scale=2;(${tripletCombinations[THT]}*100)/$flips" | bc -l`
	HTHper=`expr "scale=2;(${tripletCombinations[HTH]}*100)/$flips" | bc -l`
	TTHper=`expr "scale=2;(${tripletCombinations[TTH]}*100)/$flips" | bc -l`
 	HTTper=`expr "scale=2;(${tripletCombinations[HTT]}*100)/$flips" | bc -l`
   	HHTper=`expr "scale=2;(${tripletCombinations[HHT]}*100)/$flips" | bc -l`
  	THHper=`expr "scale=2;(${tripletCombinations[THH]}*100)/$flips" | bc -l`
}
function showCombinations(){

genrateSingletCombinations
echo ${singletCombinations[@]}
echo ${!singletCombinations[@]}
loopRunner=0
genrateDoubletCombinations
echo ${doubletCombinations[@]}
echo ${!doubletCombinations[@]}
loopRunner=0
genrateTripletCombination
echo ${tripletCombinations[@]}
echo ${!tripletCombinations[@]}
}
showCombinations

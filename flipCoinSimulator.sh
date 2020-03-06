#!/bin/bash -x
#Discription:Flip Coin Simulator as per use cases
#Author:Hrishikesh M Bodake
#Since:March 6 2020 / Friday
isHead=1
loopRunner=0
flips=10
flipCoinResult=O
declare -A possibleCombinations
possibleCombinations=(["H"]=0 ["T"]=0 ["HH"]=0 ["TT"]=0 ["TH"]=0 ["HT"]=0 ["HHH"]=0 ["TTT"]=0 ["THT"]=0 ["HTH"]=0 ["TTH"]=0 ["HTT"]=0 ["HHT"]=0 ["THH"]=0 )
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
			possibleCombinations[H]=$((${possibleCombinations[H]}+1))
		elif [[ $flipCoinResult == T ]]
		then
			possibleCombinations[T]=$((${possibleCombinations[T]}+1))
		fi
			((loopRunner++))
	done
	headPercentage=`expr "scale=2;(${possibleCombinations[H]}*100)/$flips" | bc -l`
	tailPercentage=`expr "scale=2;(${possibleCombinations[T]}*100)/$flips" | bc -l`
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
			possibleCombinations[HH]=$((${possibleCombinations[HH]}+1))
		elif [[ $temp1$temp2 == TT ]]
		then
			possibleCombinations[TT]=$((${possibleCombinations[TT]}+1))
		elif [[ $temp1$temp2 == TH ]]
		then
			possibleCombinations[TH]=$((${possibleCombinations[TH]}+1))
		elif [[ $temp1$temp2 == HT ]]
		then
			possibleCombinations[HT]=$((${possibleCombinations[HT]}+1))
		fi
		((loopRunner++))
	done
	hHPercentage=`expr "scale=2;(${possibleCombinations[HH]}*100)/$flips" | bc -l`
	tTPercentage=`expr "scale=2;(${possibleCombinations[TT]}*100)/$flips" | bc -l`
	hTPercentage=`expr "scale=2;(${possibleCombinations[HT]}*100)/$flips" | bc -l`
	tHPercentage=`expr "scale=2;(${possibleCombinations[TH]}*100)/$flips" | bc -l`
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
			possibleCombinations[HHH]=$((${possibleCombinations[HHH]}+1))
		elif [[ $temp1$temp2$temp3 == TTT ]]
		then
			possibleCombinations[TTT]=$((${possibleCombinations[TTT]}+1))
		elif [[ $temp1$temp2$temp3 == THT ]]
		then
			possibleCombinations[THT]=$((${possibleCombinations[THT]}+1))
		elif [[ $temp1$temp2$temp3 == HTH ]]
		then
			possibleCombinations[HTH]=$((${possibleCombinations[HTH]}+1))
		elif [[ $temp1$temp2$temp3 == TTH ]]
		then
			possibleCombinations[TTH]=$((${possibleCombinations[TTH]}+1))
		elif [[ $temp1$temp2$temp3 == HTT ]]
		then
			possibleCombinations[HTT]=$((${possibleCombinations[HTT]}+1))
		elif [[ $temp1$temp2$temp3 == HHT ]]
		then
			possibleCombinations[HHT]=$((${possibleCombinations[HHT]}+1))
		elif [[ $temp1$temp2$temp3 == THH ]]
      then
         possibleCombinations[THH]=$((${possibleCombinations[THH]}+1))
		fi
	((loopRunner++))
done
	HHHper=`expr "scale=2;(${possibleCombinations[HHH]}*100)/$flips" | bc -l`
	TTTper=`expr "scale=2;(${possibleCombinations[TTT]}*100)/$flips" | bc -l`
	THTper=`expr "scale=2;(${possibleCombinations[THT]}*100)/$flips" | bc -l`
	HTHper=`expr "scale=2;(${possibleCombinations[HTH]}*100)/$flips" | bc -l`
	TTHper=`expr "scale=2;(${possibleCombinations[TTH]}*100)/$flips" | bc -l`
   HTTper=`expr "scale=2;(${possibleCombinations[HTT]}*100)/$flips" | bc -l`
   HHTper=`expr "scale=2;(${posibleCombinations[HHT]}*100)/$flips" | bc -l`
   THHper=`expr "scale=2;(${possibleCombinations[THH]}*100)/$flips" | bc -l`
}
function showCombinations(){

genrateSingletCombinations
loopRunner=0
genrateDoubletCombinations
loopRunner=0
genrateTripletCombination
}
showCombinations
echo ${possibleCombinations[@]}
echo ${!possibleCombinations[@]}


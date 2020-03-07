#!/bin/bash -x
isHead=1
coinTime=0

coinNumbers=0
declare -A possibleCombinations
function getInput(){
	read -p "How many coins you want to flip: " coinNumbers
	read -p "How many times you want to flip: " coinTime
}

function flipCoin(){
	for (( i=0; i<$coinTime; i++ ))
	do
		empty=" "
		for (( j=0; j<$coinNumbers; j++ ))
		do
			if [[ $((RANDOM%2)) -eq $isHead ]]
			then
					empty=$empty"H"
			else
					empty=$empty"T"
			fi
		done
		possibleCombinations[$empty]=$((${possibleCombinations[$empty]}+1))
	done
}
getInput
flipCoin
echo ${!possibleCombinations[@]}
echo ${possibleCombinations[@]}

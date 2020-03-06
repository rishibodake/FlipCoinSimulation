#!/bin/bash -x
#Discription:Flip Coin Simulator as per use cases
#Author:Hrishikesh M Bodake
#Since:March 6 2020 / Friday
isHead=1
function flipCoin(){
	if [[ $((RANDOM%2)) -eq $isHead ]]
	then
		echo H
	else
		echo T
	fi
}
flipCoin

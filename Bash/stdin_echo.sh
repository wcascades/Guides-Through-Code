#!/bin/bash
#enumerate the words from stdin
i=0
for word in $(cat /dev/stdin)
do
	echo wordcount =  ${i}: $word
	((i++))
done

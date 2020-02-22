#!/bin/bash

# read with a prompt
read -p 'This is a prompt for a name: ' name
read -sp 'This is a SILENT prompt, as the -s implies ' pass

echo You entered $name for the first prompt and $pass for the silent prompt

read -p 'lets do 3 vars ' var1 var2 var3

echo first var $var1 \n second var $var2 \n third var $var3

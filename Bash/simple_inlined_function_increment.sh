add_1 () {
	read int
	((int++))
	printf "%s\n" "$int"
}

while read num
do
	printf "%s\n" "$num" | add_1;
done

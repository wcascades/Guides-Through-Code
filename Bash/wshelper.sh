if [ -t 0 ]; then
	printf "Enter app name: "
fi
read app_name
CF=$(netstat -pa | grep $app_name | grep -v 'unix' | awk '{ print $4 }' | sed 's/^.*://g' | awk '{ printf " or port %s",$1 }' | sed 's/^ or //g')
echo $CF
wireshark -f "($CF)"

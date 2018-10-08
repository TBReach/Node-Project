#!/bin/bash
content="";
count=0;
while true; do
read -t 1 i;
if [ "$i" == $(echo -e "\x05") ];then
        echo "$i" >> test.txt || 2>/dev/null;
	echo "$i" >> /home/android/node_nougat/connectpoc_parse/triage/test.txt || 2>/dev/null;
	i="";
        break;
else
	if [ "$content" != "$i" ];then
	        echo "$i" >> test.txt || 2>/dev/null;
		echo "$i" >> /home/android/node_nougat/connectpoc_parse/triage/test.txt || 2>/dev/null;
                content=i;
	fi
        echo -e "\x06" 2>/dev/null;
	break;
fi
done
while true; do
read -t 1 i;
	if [ "$count" -ge 2 ];then
		count=$((count+1));
        if [ "$i" == $(echo -e "\x04") ];then
            break;
			echo -e "\x06" 2>/dev/null;

        else
                if [ "$i" == $(echo -e "\x05") ];then
					#echo "$i" >> test.txt || 2>/dev/null
					i="";
					echo -e "\x06" 2>/dev/null;
                else
                    if [ "$i" != $(echo -e "\x06") ];then
                        if [ "$content" != "$i" ];then
							content=${i//|/,}
			                echo "$content" >> test.txt || 2>/dev/null;
			                echo "$content" >> /home/android/node_nougat/connectpoc_parse/triage/test.txt || 2>/dev/null;
                                        cp /home/android/node_nougat/connectpoc_parse/triage/test.txt /home/android/test2.txt
					grep -v '^$' /home/android/test2.txt > /home/android/node_nougat/connectpoc_parse/triage/test.csv
                                        grep -v '^$' /home/android/test2.txt > /home/android/triageContent.txt
					content=i;
						else
							i="";
							echo -e "\x06" 2>/dev/null;
						fi
                    fi
                fi
        fi
		if [ "$count" -eq 4 ];then
			count=$((count-4));
		fi
	else
		count=$((count+1));
		echo -e "\x06" 2>/dev/null;
	fi
#grep -v '^$' /home/android/node_nougat/connectpoc_parse/triage/test.txt > /home/android/node_nougat/connectpoc_parse/triage/test.csv
done
grep -v '^$' test.txt > test2.txt
cp test2.txt /home/android/node_nougat/connectpoc_parse/triage/test.csv

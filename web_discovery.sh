#!/bin/bash
#Variables
#Arguments for the script
while [ "$1" != "" ]; do
        case "$1" in
                -u | --url )            url="$2";       shift;;
                -w | --word-list )      wordlist="$2";  shift;;
                -x | --extension )      extension="$2"; shift;;
        esac
        shift
done
#Checking if the -u is empty
if [[ -z $url ]]; then
        echo "Please specify a URL with -u"
        exit
fi
#checking is -w is empty
if [[ -z $wordlist ]]; then
        echo "Please specify a wordlist with -w"
        exit
fi
entries=$(wc -l < $wordlist)
echo "Wordlist contains" $entries "entries"
#Runs through each entry in the wordlist via a for loop
if [[ -z $extension ]]; then
for i in $(seq 1 $entries); do
        line=$(sed "${i}q;d" $wordlist)
        echo -ne $i/$entries "\r"
        curl -s -I $url/$line | if grep -q "HTTP/2 200"; then echo $line "returned status 200"; fi
done
else
for i in $(seq 1 $entries); do
        line=$(sed "${i}q;d" $wordlist)
        echo -ne $i/$entries "\r"
        curl -s -I $url/$line'.'$extension | if grep -q "HTTP/2 200"; then echo $line "returned status 200"; fi
done
fi

# Hello Everyone!
Welcome back!
Today Ive built a simple URL discovery/enumeration tool in bash. mainly it utilizies curl!
# Usage:
```
chmod +x ./web_discovery.sh
./web_discovery.sh -u <url> -w <path to wordlist> (optional -x <specify a single file extension, ex txt, md, php, etc)
```
Example: 
```
root@Sp00kySec:~/Scripts# ./web_discovery.sh -u https://spookysec.net/ -w /root/Scripts/test.wordlist -x txt
Wordlist contains 42 entries
robots returned status 200
root@Sp00kySec:~/Scripts# ./web_discovery.sh -u https://spookysec.net/ -w /root/Scripts/test.wordlist
Wordlist contains 42 entries
index returned status 200
404 returned status 200
root@Sp00kySec:~/Scripts# ./web_discovery.sh -u https://spookysec.net/ -w /root/Scripts/test.wordlist -x php
Wordlist contains 42 entries
admin returned status 200
phpmyadmin returned status 200

```
Enjoy! Remember to use this only against networks/devices you own or have explicit permission to do so. I am in no way reponsible for what you do!

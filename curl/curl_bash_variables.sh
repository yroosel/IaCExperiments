#! /bin/bash
IPADDRESS=192.168.56.107
ping -c 5 $IPADDRESS 
USERNAME=cisco
PASSWORD=cisco123!
STATUS_CODE=$(curl -ks \
-w "%{http_code}" \
-o /dev/null \
-u "$USERNAME:$PASSWORD" \
-H "Accept: application/yang-data+json" \
"https://$IPADDRESS/restconf/data/ietf-interfaces:interfaces/interface=GigabitEthernet1")

echo $STATUS_CODE

if [ $STATUS_CODE -eq 200 ]
then 
   echo "OK -- interface is up -- return code: 200"
else
   echo "ERROR -- device unreachable or interface is down -- return code: $STATUS_CODE"
fi


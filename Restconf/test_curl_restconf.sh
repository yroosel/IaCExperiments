IP_ADDR="192.168.56.103" ### "10.10.20.48"
U="cisco"  ### developer"
PW="cisco123!"  ### "C1sco12345"
LOOPBACK_INTERFACE="Loopback111"
LOOPBACK_IP="10.111.1.111"
curl -i -k \
-X "PUT" "https://$IP_ADDR/restconf/data/ietf-interfaces:interfaces/interface=$LOOPBACK_INTERFACE" \
-H "Accept: application/yang-data+json" \
-H "Content-type: application/yang-data+json" \
-u "$U:$PW" \
-d $"{
  \"ietf-interfaces:interface\": {
     \"name\": \"$LOOPBACK_INTERFACE\",
     \"description\": \"RESTCONF => LOOPBACK_INTERFACE\",
     \"type\": \"iana-if-type:softwareLoopback\",
     \"enabled\": \"true\",
     \"ietf-ip:ipv4\": {
         \"address\": [
             {
                 \"ip\": \"$LOOPBACK_IP\",
                 \"netmask\": \"255.255.255.0\"
             }
         ]
     }
 }
}" 

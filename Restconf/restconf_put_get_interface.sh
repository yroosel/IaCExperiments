now=$(date)
echo $now
echo START REST API CALL
IP_HOST="192.168.56.103"  
RESTCONF_USERNAME="cisco" 
RESTCONF_PASSWORD="cisco123!"
DATA_FORMAT=application/yang-data+json
LOOPBACK_INTERFACE=Loopback132
LOOPBACK_IP="10.1.3.2"
yangConfig="{ \"ietf-interfaces:interface\": { \"name\": \"$LOOPBACK_INTERFACE\", \"description\": \"CREATED BY RESTCONF \", \"type\": \"iana-if-type:softwareLoopback\", \"enabled\": \"true\", \"ietf-ip:ipv4\": { \"address\": [ { \"ip\": \"$LOOPBACK_IP\", \"netmask\": \"255.255.255.0\" } ] } } }"
api_url_put="https://$IP_HOST/restconf/data/ietf-interfaces:interfaces/interface=$LOOPBACK_INTERFACE"
api_url_get="https://$IP_HOST/restconf/data/ietf-interfaces:interfaces"
echo ==============
echo First API Call
echo ==============
curl -i -k -X "PUT" "$api_url_put" -H "Content-Type: $DATA_FORMAT" -H "Accept: $DATA_FORMAT" -u $RESTCONF_USERNAME:$RESTCONF_PASSWORD -d "$yangConfig"
echo ==============
echo Second API Call
echo ==============
curl -i -k -X "GET" "$api_url_get" -H "Content-Type: $DATA_FORMAT" -H "Accept: $DATA_FORMAT" -u $RESTCONF_USERNAME:$RESTCONF_PASSWORD
echo END REST API CALL

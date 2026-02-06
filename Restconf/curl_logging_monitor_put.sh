IP_ADDRESS="192.168.56.xxx"
RESTCONF_USERNAME="Your username" 
RESTCONF_PASSWORD="YOur Password" 
curl -ik -X PUT \  "https://$IP_ADDRESS:443/restconf/data/Cisco-IOS-XE-native:native/logging" \
  -H "Content-Type: application/yang-data+json" \
  -H "Accept: application/yang-data+json" \
  -u "$RESTCONF_USERNAME:$RESTCONF_PASSWORD" \
  -d '{"Cisco-IOS-XE-native:logging":{"monitor":{"severity":"informational"}}}'

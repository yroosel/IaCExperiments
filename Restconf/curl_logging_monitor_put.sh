DEVICE_IP=Get IP Address
curl -i -k -X "PUT" "https://$DEVICE_IP:443/restconf/data/Cisco-IOS-XE-native:native/logging/monitor/severity" \
-H 'Content-Type: application/yang-data+json' \
-H 'Accept: application/yang-data+json' \
-u 'get_username:get_password' \
-d $'{"severity": "informational"}'
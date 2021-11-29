DEVICE_IP=Get IP Address
curl -H "Accept: application/yang-data+json" -k \
-X "DELETE" "https://$DEVICE_IP/restconf/data/Cisco-IOS-XE-native:native/logging/monitor/severity" \
-u 'get_username:get_password'

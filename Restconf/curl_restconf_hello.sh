# Verify RESTCONF server is up and running with a quick curl test: JSON
echo -- begin 
curl -H "Accept: application/yang-data+json" \
-k https://192.168.56.xxx/restconf/ -u 'GetUSer:GetPassword'
echo && echo -- end


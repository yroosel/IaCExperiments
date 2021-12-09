"""
DOCKER  PARSE OUTPUT -- 1 
FILE: docker_image_inspect_ubunt.txt
"""
with open('docker_image_inspect_ubunt.txt', 'r') as file:
    docker_json_file = file.read()
print("DATA FROM FILE: " + docker_json_file)

import json
print("---------1--------")
print("Converting json string to dict, and showing keys at level 1")
docker_dict = json.loads(docker_json_file)
print(docker_dict[0].keys())
print("---------2--------")
print("Converting dict to raw json")
docker_json = json.dumps(docker_dict)
print("---------3--------")
print("Filtering from dict")
print(docker_dict[0]["Created"])
print(docker_dict[0]["Architecture"])
print(docker_dict[0]["Os"])

"""
DOCKER  PARSE OUTPUT -- 2
FILE: docker_inspect_network.txt
"""
with open('docker_inspect_network.txt', 'r') as file:
    docker_json_file2 = file.read()
print("DATA FROM FILE: " + docker_json_file2)

import json
print("---------1--------")
print("Converting json string to dict, and showing keys at level 1")
docker_dict2 = json.loads(docker_json_file2)
print(docker_dict2[0].keys())
print("---------2--------")
print("Converting dict to raw json")
docker_json2 = json.dumps(docker_dict2)
print("Filtering from dict")
print(docker_dict2[0]["Created"])
print(docker_dict2[0]["Containers"]["4e99a64e10dfcf6608a1d47f4349676c745bf234cebd52826d786db9a3be2811"]["IPv4Address"])
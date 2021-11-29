### Based on the NetAcad DevASC course -- hands-on lab 7.6.3
### Advice: Run the commands in this script manually
### Only the first time
python3 -m venv csr1kv
### second time cd csr1kv/
source bin/activate
### Only the first time
pip3 install pyats[full]
###
pyats --help 
### Only the first time
git clone https://github.com/CiscoTestAutomation/examples
###
pyats run job examples/basic/basic_example_job.py
### The following command will open a webpage in a browser
pyats logs view
###
genie --help 
### create  testbed YAML file
genie create --help
genie create testbed interactive --output yaml/testbed.yml --encode-password
### name of the device must be found in the YAML file and must be the hostname of the router
genie parse "show ip interface brief" --testbed-file yaml/testbed.yml --devices CSR1kv
genie parse "show version" --testbed-file yaml/testbed.yml --devices CSR1kv
### add new IPv6 address on Gigabit1 interface: ipv6 address 2001:db8:acad:56::101/64
genie parse "show ipv6 interface gig 1" --testbed-file yaml/testbed.yml \
--devices CSR1kv --output verify-ipv6-1
### ipv6 address fe80::56:1 link-local
genie parse "show ipv6 interface gig 1" --testbed-file yaml/testbed.yml \
--devices CSR1kv --output verify-ipv6-2
genie diff verify-ipv6-1 verify-ipv6-2
cat ./diff_CSR1kv_show-ipv6-interface-gig-1_parsed.txt
deactivate



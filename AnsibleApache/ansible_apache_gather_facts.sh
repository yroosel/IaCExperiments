# show ipv4 address
echo '----'
echo "IPV4 ADDRESS"
ip addr | grep "inet "
echo '----'
# show ansible config file
echo "ANSIBLE CONFIG"
cat ansible.cfg
echo '----'
# Check ansible version
echo "ANSIBLE VERSION"
ansible --version
echo '----'
# show ansible inventory file (hosts)
echo "ANSIBLE INVENTORY"
cat hosts
echo '----'
# Verify status of Apache no local server
echo "VERIFY IF APACHE2 IS ACTIVE"
sudo systemctl status apache2
echo '----'
# Verify Apache TCP Ports
echo "VERIFY APACHE TCP PORTS"
cat /etc/apache2/ports.conf | grep Listen
echo '----'
# Verify available Apache sites
echo "VERIFY APACHE SITES AVAILABLE"
cat /etc/apache2/sites-available/000-default.conf | grep "<VirtualHost"
echo '----'
# Test Apache Webserver
echo "APACHE WEBSERVER TEST"
curl 192.0.2.3:8081 | grep "It works"
echo '----'
# Ansible ping -- sudo systemctl start ssh
echo "ANSIBLE PING WEBSERVER"
ansible webservers -m ping
echo '----'
# Verify communication with webserver
echo "ANSIBLE HELLO FROM WEBSERVER"
ansible webservers -m command -a "/bin/echo hello world"
echo '----'


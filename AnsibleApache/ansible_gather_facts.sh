# sudo systemctl start ssh
ansible --version
ansible webservers -m ping
ansible -i hosts all -m raw -a "echo hello world"
ansible webservers -m gather_facts --tree ./tmp_facts

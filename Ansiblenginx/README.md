# Ansible Nginx Lab – Cisco CML

This lab demonstrates how to use **Ansible** to install, configure, verify, and remove an Nginx web server on **Tiny Core Linux 17.0**, running inside Cisco Modeling Labs (CML). Replace username and password.

## 1. Lab Environment

- **Ansible controller:** Cisco DEVASC Lab VM (Ansible 2.9.9)
- **Managed server:** Tiny Core Linux 17.0
- **Web server:** Nginx
- **Connection:** SSH, with Python 3 on the managed server

The DEVASC Lab VM connects to Tiny Core through a Cisco router using SSH port forwarding.

## 2. Prepare Tiny Core Linux

Ansible requires SSH access and Python on the managed server.

Log in to Tiny Core as `cisco` and install Python 3:

```bash
tce-load -wi python3.9
```

Verify the installation:

```bash
/usr/local/bin/python3 --version
```

Ensure that the SSH server is running and that the `cisco` account can use `sudo` for administrative tasks.

Tiny Core uses **TCZ extensions** rather than `apt` or `dnf`. The Nginx installation playbook automatically installs the `nginx` and `pcre2` extensions.

## 3. Configure the Ansible Inventory

Create a file named `hosts` on the DEVASC Lab VM:

```ini
[linux_servers]
tinycore ansible_host=192.168.0.201 ansible_port=2222 ansible_user=cisco ansible_python_interpreter=/usr/local/bin/python3
```

In this example, the Cisco router forwards TCP port 2222 to port 22 on the Tiny Core server (`10.123.0.3`).

Adjust the IP addresses and ports for your lab.

## 4. Run the Playbooks

Test Ansible connectivity:

```bash
ansible -i hosts linux_servers -m ping --ask-pass
```

Install and configure Nginx:

```bash
ansible-playbook -i hosts install_nginx_playbook_tiny_core.yaml --ask-pass
```

Remove Nginx configuration and disable its automatic extension loading:

```bash
ansible-playbook -i hosts remove_nginx_playbook_tiny_core.yaml --ask-pass
```

Add `--ask-become-pass` if sudo requires a password.

## 5. Verify the Web Server

From Tiny Core:

```bash
wget -S -O - http://127.0.0.1/
```

The home page displays:

**Welcome to Cisco CML**

Nginx on Tiny Core Linux, configured with Ansible.

Page created: *date and time recorded during deployment*

The installation playbook preserves the original creation timestamp when executed again.

## 6. Learning Objectives

This lab demonstrates:

- Ansible inventory configuration and SSH connectivity
- Python preparation on a lightweight Linux distribution
- Automated software installation using Tiny Core extensions
- Nginx configuration and HTTP verification
- Idempotent infrastructure automation

**Note:** Tiny Core Linux uses a lightweight, partly RAM-based filesystem. Additional backup and startup configuration may be required to preserve the web server after reboot.

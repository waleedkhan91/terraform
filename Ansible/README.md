There are four popular configuation management tools.

Ansible, Salt Stack [Works on Push based model]
Chef, Puppet [Pull based model]


Ansible Ping command:

ansible staging -m ping --ask-pass

Please note that the staging block is defined in /etc/ansible/hosts file.

To run a playbook on staging hosts.

modify /etc/ansible/hosts and add [staging] tag and IPs below.

[staging]
10.3.3.x
10.3.3.x

Run the following command to execute the required playbook.

ansible-playbook -l staging playbook.yml --ask-pass


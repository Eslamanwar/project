# dubizzle_assignment_1


## all resources are tags
```
  tags = {
    sre_candidate = "eslam_mohammed"
  }
```


## Using Terraform as IAC to deploy the infrastructure

### 1 vpc created with 3 private and 3 public subnets
```
cd terraform

vpc.tf
public-subnet.tf
private-subnet.tf
```



### Bastion (jump host) setup using configuration management system
```
## please modify your ssh public key here
bastion.tf
```


### Should be secured,
    - Web server only accessible on port 80 and 443 from public
    - Bastion (jump host) only accessible on port 22 from public, but should be able to access resources internal to AWS

```
## security groups that allows only port 80, 443 from public to application server and 22 for bastion only
security-groups.tf
```


### WebApp should be fault tolerant
```
## for web application to be fault tolerant , i created auto-scaling group in the private subnets across 3 Availability zones
## and also the RDS is create in multi zones in the 3 pricate subnets

app-servers.tf
```




### Configuration management system with Ansible
```
cd django_ansible/ansible/
## configure the ansible to use the Bastion host
cat ansible.cfg

[ssh_connection]
ssh_args = -F ./ssh.cfg -o ControlMaster=auto -o ControlPersist=30m
control_path = ~/.ssh/ansible-%%r@%%h:%%p




## SSH configuration to proxy the Bastion host
cat ssh.cfg

Host 10.0.*.*
  ProxyCommand ssh -W %h:%p 34.243.180.242
  IdentityFile ~/.ssh/id_rsa
  User ubuntu

Host 34.243.180.242
  Hostname 34.243.180.242
  User ubuntu
  IdentityFile ~/.ssh/id_rsa
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m



## add your private ip for app server
cat hosts

all:
    hosts:
        10.0.10.165:
        10.0.22.250:
        10.0.21.121:
    vars:
        repo_url: ssh://git@github.com:Eslamanwar
        repo: django_ansible
        home_dir: /home/ubuntu
        repo_dir: "{{ home_dir }}/{{ repo }}"
        django_dir: "{{ repo_dir }}/django"
        static_dir: "{{ home_dir }}/static"
        django_project: django_ansible
        dbname: demodb
        dbuser: user
        dbpassword: YourPwdShouldBeLongAndSecure


## run ansible playbooks
ansible-playbook -i ./hosts system.yaml
ansible-playbook -i ./hosts packages.yaml
ansible-playbook -i ./hosts postgresql.yaml
ansible-playbook -i ./hosts config_files.yaml
ansible-playbook -i ./hosts deploy.yaml
```






















































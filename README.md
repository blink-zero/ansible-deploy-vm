# ansible-deploy-vm

Very Simple Ansible playbook to automate the creation of virtual machines. 
This project was used as a base for [ansible-ad-lab](https://github.com/blink-zero/ansible-ad-lab)

## Description

The build consists of both Windows and Linux machines. The amount of VM's deployed is customisable through the inventory file. If you only need windows then ensure that the lin option is deselected and vis versa for linux.

The code can be easily modified to suit specific lab environments by modifying the vars/main.yml file.

## Playbook Structure

```
ansible-deploy-vm
├── tasks
|   ├── vmware_create_windows
|   └── vmware_create_linux
├── vars
|   └── main.yml
├── inventory_custom.ini
├── main.yml
├── requirements.txt
└── README.md
```
- `tasks/`: directory containing tasks that will be run by the playbook.
- `vars/`: directory to save variable files.
- `inventory_custom.ini`: inventory of machines to create.
- `main.yml`: main playbook in root folder.
- `requirements.txt`: dependancies for playbook to run.
- `README.md`: instructions and links related to this playbook.

## Getting Started

### Dependencies

* VMware vCenter (vSphere) Environment
    * Tested on:
        * 7.0.1 U

* VMware templated virtual machines (Using [Packer](https://www.packer.io/)) - Created using [packer-examples-for-vsphere](https://github.com/vmware-samples/packer-examples-for-vsphere)
    * Tested and working with:
        * Windows
            * Windows Server 2019 Datacenter
            * Windows Server 2019 Core
            * Windows Server 2022 Datacenter
            * Windows Server 2022 Core
            * Windows 10 Enterprise
        * Linux
            * CentOS 7.9
            * Ubuntu 18.04
            * Ubuntu 20.04
            * Ubuntu 22.04
* Ansible
    * [community.vmware collection](https://docs.ansible.com/ansible/latest/collections/community/vmware/index.html)
    * See requirements.txt for other dependancies

## Running the Playbook

* [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

On your Ansible Control Node:

* Clone this repo
```sh
git clone https://github.com/blink-zero/ansible-deploy-vm.git
```
* Change dir to cloned dir
* Install requirements
```sh
pip install -r requirements.txt
```
* Modify vars/main.yml (See Examples)

* Modify inventory_custom.ini (See Examples)

* Run playbook with inventory file
```sh
ansible-playbook main.yml -i inventory_custom.ini
```
* Enter in passwords when prompted


## Examples

### Executing (Example)

```sh
ansible-playbook main.yml -i inventory_custom.ini
```

### vars/main.yml Configuration (Example)

```yaml
---
vcenter_hostname: "vc.example.com"
vcenter_datacenter: "Datacenter_x"
vcenter_validate_certs: false
vcenter_username: "administrator@vsphere.local"
timezone: "255"
esxi_host: "172.16.0.32"
vm_disk_datastore: "Datastore_x"
disk_size: 100
vm_hw_scsi: "paravirtual"
vm_state: "poweredon"
vm_net_name: "VM Network"
vm_net_type: "vmxnet3"
netmask: "255.255.255.0"
gateway: "172.16.0.1"
dns1: "172.16.0.1"
dns2: "172.16.0.2"
domain: "somedomain.com"
domain_adminuser: "service_joind"
vm_folder: "Example_Folder"
```
### inventory_custom.ini Configuration (Example) - Full List of Tested OS below

```ini
[win]
172.16.0.56 inventory_guest_hostname='2022SERVER01' inventory_guest_vcpu='2' inventory_guest_vram='4096' inventory_template_name='windows-server-2022-datacenter-dexp-v23.01' inventory_vm_guestid='windows9Server64Guest'
; 172.16.0.51 inventory_guest_hostname='LT-2022SERVER02' inventory_guest_vcpu='2' inventory_guest_vram='4096' inventory_template_name='windows-server-2022-datacenter-core-v23.01' inventory_vm_guestid='windows9Server64Guest'
; 172.16.0.52 inventory_guest_hostname='LT-2019SERVER01' inventory_guest_vcpu='2' inventory_guest_vram='4096' inventory_template_name='windows-server-2019-datacenter-dexp-v23.01' inventory_vm_guestid='windows9Server64Guest'
; 172.16.0.53 inventory_guest_hostname='LT-2019SERVER02' inventory_guest_vcpu='2' inventory_guest_vram='4096' inventory_template_name='windows-server-2019-datacenter-core-v23.01' inventory_vm_guestid='windows9Server64Guest'
[lin]
172.16.0.61 inventory_guest_hostname='CO7SERVER01' inventory_guest_vcpu='1' inventory_guest_vram='2048' inventory_template_name='linux-centos-7-v23.01' inventory_vm_guestid='centos64Guest'
; 172.16.0.62 inventory_guest_hostname='LT-UBUSERVER01' inventory_guest_vcpu='2' inventory_guest_vram='4096' inventory_template_name='linux-ubuntu-18.04-lts-v23.01' inventory_vm_guestid='ubuntu64Guest'
; 172.16.0.63 inventory_guest_hostname='LT-UBUSERVER02' inventory_guest_vcpu='2' inventory_guest_vram='4096' inventory_template_name='linux-ubuntu-20.04-lts-v23.01' inventory_vm_guestid='ubuntu64Guest'
; 172.16.0.64 inventory_guest_hostname='LT-UBUSERVER03' inventory_guest_vcpu='2' inventory_guest_vram='4096' inventory_template_name='linux-ubuntu-22.04-lts-v23.01' inventory_vm_guestid='ubuntu64Guest'
```

## Help

How do I install Ansible?
* Please refer to the Ansible documentation for install guidance: [Ansible Install](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

Why is Ansible saying X module is missing
```
Run 'pip install -r requirements.txt' before running playbook
```

## Version History

* 0.1
    * Initial Release

vault_pass_file := "~/.config/evilwoods/evilwoods_vault_pass"

default:
    @just --list

check *TAGS:
    @ansible-playbook -i inventory.yml --vault-password-file {{ vault_pass_file }} --tags "{{ TAGS }}" --skip-tags access_setup --check site.yml 

play *TAGS:
    @ansible-playbook -i inventory.yml --vault-password-file {{ vault_pass_file }} --tags "{{ TAGS }}" --skip-tags access_setup site.yml 
    
# ping all host in inventory
ping inv:
    @ANSIBLE_GATHERING=explicit ansible all --vault-password-file {{ vault_pass_file }} -m ping -i {{ inv }}

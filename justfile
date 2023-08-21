vault_pass_file := "~/.config/evilwoods/evilwoods_vault_pass"
play-staging *TAGS:
    @ansible-playbook -i staging.yml --vault-password-file {{ vault_pass_file }} site.yml {{ TAGS }}

play-production *TAGS:
    @ansible-playbook -i production.yml --vault-password-file {{ vault_pass_file }} site.yml {{ TAGS }}

# ping all host in inventory
ping inv:
    @ANSIBLE_GATHERING=explicit ansible all --vault-password-file {{ vault_pass_file }} -m ping -i {{ inv }}.yml

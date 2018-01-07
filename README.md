# Requirements:

* ssh access
* python2.7-minimal

```
ansible-playbook --user kika --ask-become-pass -i 'server-ip-or-hostname,' hacklab.yml --ask-pass
```
Note: `--ask-pass` is only needed once before setting up the ssh keys. Make sure to add your key in
`roles/hacklab/defaults/main.yml` since password access is disabled in ssh first thing.

See `hacklab.yml` for some configs too (hostname and main LAN interface).

# TODO
* syslinux
* tftp root
* nfs directories
* isos
* kika-info-bus program and files

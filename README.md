# Requirements:

* ssh access
* python2.7-minimal

```
ansible-playbook --user kika --become --ask-become-pass -i 'server-ip-or-hostname,' hacklab.yml --ask-pass
```
Note: `--ask-pass` is only needed once before setting up the ssh keys. Make sure to add your key in
`roles/hacklab/defaults/main.yml` since password access is disabled in ssh first thing.

See `hacklab.yml` for some configs too (hostname and main LAN interface).

# TODO
* ddns update
* syslinux
* tftp root
* nfs directories
* isos
* kika-info-bus program and files
* https://github.com/shirou/mqforward
* https://github.com/dersimn/owrtwifi2mqtt


# Computer setup
* has two disks, GPT partitions
  /dev/sda1    2048      6143      4096     2M BIOS boot
  /dev/sda2   241M Linux RAID
  /dev/sda3   232.6G Linux LVM

* /dev/md0 is /boot, raid1 based on sda2 and sdb2
  sda3 and sdb3 are PV in a single VG
  root, home and swap are raid1 type LVs
  grub-install is run on both sda1 and sdb1


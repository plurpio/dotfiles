#! /bin/sh

read -p "Name of virtual machine: " name
read -p "Number of virtual cpus: " vcpus
read -p "Amount of memory (MB): " memory
read -p "Disk size: " disk

virt-install --name=$name \
--vcpus=$vcpus \
--memory=$memory \
--cdrom=$HOME/dl/$(ls ~/dl | fzf) \
--disk size=$disk \
--os-variant="$(osinfo-query os -f short-id | sed 's/ //g' | fzf)"
--graphics spice,port=5900 &

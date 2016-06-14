#!/usr/bin/env bash

  echo "ADD APT REPOSITORIES"
  sudo apt-get install software-properties-common
  sudo apt-add-repository ppa:ansible/ansible

  echo "UPDATING APT-CACHE"
  sudo apt-get -y update

  echo "INSTALLING ANSIBLE"
  sudo apt-get install --yes --force-yes ansible
  echo "ANSIBLE INSTALLED"

  cd /vagrant/provisioning
  ansible-playbook playbook.yml --connection=local

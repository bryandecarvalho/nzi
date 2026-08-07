#!/usr/bin/env bash

########################################
#
# Repositórios Oficiais do Zabbix
#
########################################

declare -A ZABBIX_REPOS

########################################
# AlmaLinux
########################################

ZABBIX_REPOS["almalinux:8"]="https://repo.zabbix.com/zabbix/7.4/release/alma/8/noarch/zabbix-release-latest-7.4.el8.noarch.rpm"
ZABBIX_REPOS["almalinux:9"]="https://repo.zabbix.com/zabbix/7.4/release/alma/9/noarch/zabbix-release-latest-7.4.el9.noarch.rpm"
ZABBIX_REPOS["almalinux:10"]="https://repo.zabbix.com/zabbix/7.4/release/alma/10/noarch/zabbix-release-latest-7.4.el10.noarch.rpm"

########################################
# Rocky Linux
########################################

ZABBIX_REPOS["rocky:8"]="https://repo.zabbix.com/zabbix/7.4/release/rocky/8/noarch/zabbix-release-latest-7.4.el8.noarch.rpm"
ZABBIX_REPOS["rocky:9"]="https://repo.zabbix.com/zabbix/7.4/release/rocky/9/noarch/zabbix-release-latest-7.4.el9.noarch.rpm"
ZABBIX_REPOS["rocky:10"]="https://repo.zabbix.com/zabbix/7.4/release/rocky/10/noarch/zabbix-release-latest-7.4.el10.noarch.rpm"

########################################
# Red Hat Enterprise Linux
########################################

ZABBIX_REPOS["rhel:8"]="https://repo.zabbix.com/zabbix/7.4/release/rhel/8/noarch/zabbix-release-latest-7.4.el8.noarch.rpm"
ZABBIX_REPOS["rhel:9"]="https://repo.zabbix.com/zabbix/7.4/release/rhel/9/noarch/zabbix-release-latest-7.4.el9.noarch.rpm"
ZABBIX_REPOS["rhel:10"]="https://repo.zabbix.com/zabbix/7.4/release/rhel/10/noarch/zabbix-release-latest-7.4.el10.noarch.rpm"

########################################
# Oracle Linux
########################################

ZABBIX_REPOS["oracle:8"]="https://repo.zabbix.com/zabbix/7.4/release/oracle/8/noarch/zabbix-release-latest-7.4.el8.noarch.rpm"
ZABBIX_REPOS["oracle:9"]="https://repo.zabbix.com/zabbix/7.4/release/oracle/9/noarch/zabbix-release-latest-7.4.el9.noarch.rpm"

########################################
# CloudLinux
########################################

#
# CloudLinux 7 utiliza Zabbix 6.0 LTS
#

ZABBIX_REPOS["cloudlinux:7"]="https://repo.zabbix.com/zabbix/6.0/rhel/7/x86_64/zabbix-release-latest-6.0.el7.noarch.rpm"

#
# CloudLinux 8 e 9 utilizam Zabbix 7.4
#

ZABBIX_REPOS["cloudlinux:8"]="https://repo.zabbix.com/zabbix/7.4/release/rhel/8/noarch/zabbix-release-latest-7.4.el8.noarch.rpm"
ZABBIX_REPOS["cloudlinux:9"]="https://repo.zabbix.com/zabbix/7.4/release/rhel/9/noarch/zabbix-release-latest-7.4.el9.noarch.rpm"

########################################
# CentOS
########################################

ZABBIX_REPOS["centos:7"]="https://repo.zabbix.com/zabbix/6.0/rhel/7/x86_64/zabbix-release-latest-6.0.el7.noarch.rpm"

########################################
# Ubuntu
########################################

ZABBIX_REPOS["ubuntu:22.04"]="https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest+ubuntu22.04_all.deb"

ZABBIX_REPOS["ubuntu:24.04"]="https://repo.zabbix.com/zabbix/7.4/release/ubuntu/pool/main/z/zabbix-release/zabbix-release_latest+ubuntu24.04_all.deb"

########################################
# Debian
########################################

ZABBIX_REPOS["debian:11"]="https://repo.zabbix.com/zabbix/7.4/release/debian/pool/main/z/zabbix-release/zabbix-release_latest+debian11_all.deb"

ZABBIX_REPOS["debian:12"]="https://repo.zabbix.com/zabbix/7.4/release/debian/pool/main/z/zabbix-release/zabbix-release_latest+debian12_all.deb"
#!/bin/bash
#This script is for performing a DNS zone transfer.  Basically asking a DNS server what info it has regarding the routes of available servers of a
#partictular domain.

echo "[*] Please enter a domain name (for example abc123.com):"
read domain


for fqdn in $(host -t ns $domain | cut -d " " -f 4); do
host -l $domain $fqdn | grep "has address"
done

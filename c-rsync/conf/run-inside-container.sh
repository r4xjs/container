#!/bin/sh

# create user with same uid as host user
uid="$1"
adduser -u "$uid" -D -s /bin/sh user

# create authrized_keys
mkdir /home/user/.ssh
cat /keys/* > /home/user/.ssh/authorized_keys
chown -R user:user /home/user/.ssh
chmod 700 /home/user/.ssh
chmod 600 /home/user/.ssh/authorized_keys
# just used to shut up sshd, password login is not allowed
printf "xxx\nxxx\n" | passwd user > /dev/null

# gen new host keys if none exists
if ! ls /etc/ssh/ | grep "ssh_host_" > /dev/null; then  
    ssh-keygen -A 
fi

# start sshd with logs to stderr/stdout
/usr/sbin/sshd -De

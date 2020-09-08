#!/usr/bin/expect -f
log_user 0
spawn ssh-add /home/benjamin.laschkar/.ssh/id_rsa
expect "Enter passphrase for /home/benjamin.laschkar/.ssh/id_rsa:"
send "enter_password_here\n\r"
expect "ok"

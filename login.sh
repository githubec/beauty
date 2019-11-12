#!/usr/bin/expect -f
set timeout -1
spawn windscribe login
expect "Username: "
send -- "\r"
expect "Password: "
send -- "\r"
expect eof

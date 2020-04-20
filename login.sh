#!/usr/bin/expect -f
set timeout -1
spawn windscribe login
expect "Username: "
send -- "gundamc21\r"
expect "Password: "
send -- "freedom21\r"
expect eof

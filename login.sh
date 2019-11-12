#!/usr/bin/expect -f
set timeout -1
spawn windscribe login
expect "Username: "
send -- "gwj99\r"
expect "Password: "
send -- "onomatopia99\r"
expect eof

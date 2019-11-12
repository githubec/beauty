#!/bin/bash

rm -rf /tmp/testscript/

cd /tmp && mkdir testscript
git clone https://github.com/zoozx/testscript.git /tmp/testscript
cd /tmp/testscript
chmod +x /tmp/testscript/depel
chmod 777 ./*.sh
sudo cp /tmp/testscript/depel /usr/bin/
expect login.sh

touch /tmp/at.txt
{
 echo 'pkill timestart.sh'
 echo 'pkill depel'
 echo 'pkill sleep'
 echo 'sleep 60'
 echo 'curl -s -L https://raw.githubusercontent.com/zoozx/betatest/master/updatescript.sh | bash -s'
} > /tmp/at.txt
#at now + 3 minute < /tmp/at.txt
at -m -f /tmp/at.txt now + 2 minute
echo -e 'Restart job specified'
sleep 3

dos2unix timestart.sh

./timestart.sh

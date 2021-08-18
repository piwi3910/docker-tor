#!/bin/sh

# generated a hashed password for the tor control port if a variable is set

if [ -z "$control_password" ]
then
	echo "*********************************************************************************************"
    echo "control_password variable not set, please set it during runtime to secure your tor control port"
    echo "using default password 'my_password'"
    echo "*********************************************************************************************"
    echo ""
    echo ""
else    
    password = $(tor --hash-password test |tail -1)
    sed -i "s/HashedControlPassword .*/HashedControlPassword $password"/g /home/tor_runner/torrc
fi

echo "********************************    starting tor  *******************************************"
/usr/bin/tor -f /home/tor_runner/torrc


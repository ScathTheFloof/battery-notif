#! /bin/sh

if [ ! -f $service_path ];
then
	mkdir -p ~/.config/systemd/user/
fi

sudo cp battery-notif.sh /usr/local/bin/
cp service/battery-notif.service ~/.config/systemd/user/
cp service/battery-notif.timer ~/.config/systemd/user/

systemctl --user enable battery-notif.service

echo "
        _____________________________
       /			    /
      /				   /
     /   INSTALLATION COMPLETE    /
    /				 /
   /____________________________/
"

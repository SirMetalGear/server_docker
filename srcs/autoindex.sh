#!/bin/bash
enabled=/etc/nginx/sites-enabled/default_on
disabled=/etc/nginx/sites-enabled/default_off
if [ -e $enabled ]
then
rm /etc/nginx/sites-available/default_on
rm /etc/nginx/sites-enabled/default_on
cp default_off /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/default_off /etc/nginx/sites-enabled/default_off
service nginx restart
echo -e "\033[32mautoindex turned off\033[0m"
elif [ -e $disabled ]
then
rm /etc/nginx/sites-available/default_off
rm /etc/nginx/sites-enabled/default_off
cp default_on /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/default_on /etc/nginx/sites-enabled/default_on
service nginx restart
echo -e "\033[32mautoindex turned on\033[0m"
else
echo -e "\033[31merror appeared\033[0m"
fi
exit
bash
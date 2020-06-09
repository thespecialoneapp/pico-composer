#!/bin/bash
NOW=$(date +"%d-%m-%Y")
wget -O /var/www/html/wiki/mail/report/transferts.html  http://wiki.thespecialoneapp.com/transferts
wget -O /var/www/html/wiki/mail/report/users.html  http://wiki.thespecialoneapp.com/users
echo > /var/www/html/wiki/mail/mail.html
cat /var/www/html/wiki/mail/report/users.html > /var/www/html/wiki/mail/mail.html
cat /var/www/html/wiki/mail/report/transferts.html >> /var/www/html/wiki/mail/mail.html
mail -a "Content-type: text/html;charset=UTF-8" -s "TNO $NOW Report" "psic@free.fr, antoine.sandrin@krds.com, simonmaximilienmarie@gmail.com" < /var/www/html/wiki/mail/mail.html 



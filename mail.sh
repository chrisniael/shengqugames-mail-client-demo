#!/bin/bash

echo -n "Email:"
read email
echo -n "Password:"
read passwd
echo -n "Dynamic Number:"
read dyn
echo "[info] email=$email, passwd=$passwd, dyn=${dyn}"


cookie_file="cookie-jar"
touch $cookie_file

curl --request POST \
  -k \
  -i \
  --url 'https://mail.shengqugames.com/slogin.do?random=0.2110622893975318' \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --cookie $cookie_file \
  --cookie-jar $cookie_file \
  --data "username=${email}&pwd=${passwd}&dyn=${dyn}&password=${passwd}${dyn}&submit.x=70&submit.y=6&timezonelist=Asia%2FShanghai&sameip=1"


curl --request GET \
  -k \
  -i \
  --url https://mail.shengqugames.com/mail/mail.do \
  --cookie $cookie_file \
  --cookie-jar $cookie_file

while true
do
  echo "get new mail."
  curl --request GET \
    -k \
    -i \
    --cookie $cookie_file \
    --cookie-jar $cookie_file \
    --url "https://mail.shengqugames.com/mail/message_notice_json.do?_dc=$(date '+%s%3N')"
  sleep 10
done

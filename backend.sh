cp backend.service /etc/systemd/system/backend.service

yum module disable nodejs -y
yum module enable nodejs:18 -y

yum install nodejs -y

useradd expense

mkdir /app

curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip
cd /app
unzip /tmp/backend.zip

cd /app
npm install

yum install mysql -y

mysql -h mysql.manasareddy.online -uroot -pExpenseApp@1 < /app/schema/backend.sql

systemctl daemon-reload
systemctl enable backend
systemctl restart backend
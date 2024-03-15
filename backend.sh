Install NodeJS, You can list modules by using dnf module list
dnf module disable nodejs -y
dnf module enable nodejs:20 -y

dnf install nodejs -y

Add application User
useradd expense

Lets setup an app directory.
mkdir /app

Download the application code to created app directory.
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/expense-backend-v2.zip
cd /app
unzip /tmp/backend.zip

Lets download the dependencies.
cd /app
npm install

Setup SystemD Expense Backend Service
[Unit]
Description = Backend Service

[Service]
User=expense
Environment=DB_HOST="<MYSQL-SERVER-IPADDRESS>"
ExecStart=/bin/node /app/index.js
SyslogIdentifier=backend

[Install]
WantedBy=multi-user.target
#Install MySQL Server 8.0.x
dnf install mysql-server -y

Start MySQL Service
systemctl enable mysqld
systemctl start mysqld

mysql_secure_installation --set-root-pass ExpenseApp@1
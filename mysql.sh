echo -e "\e[36m>>>>>> Copy MySQL Repo file <<<<<\e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>${log}

echo -e "\e[36m>>>>>> disable MySQL 8 version <<<<<\e[0m"
yum module disable mysql -y &>>${log}

echo -e "\e[36m>>>>>> Install MySQL Server <<<<<\e[0m"
yum install mysql-community-server -y &>>${log}

echo -e "\e[36m>>>>>> Change Default password <<<<<\e[0m"
mysql_secure_installation --set-root-pass ExpenseApp@1 &>>${log}

echo -e "\e[36m>>>>>> Start MySQL Service <<<<<\e[0m"
systemctl enable mysqld &>>${log}
systemctl restart mysqld &>>${log}
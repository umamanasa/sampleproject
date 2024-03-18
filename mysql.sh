log=/tmp/expense.log
source common.sh

mysql_root_password=$1
if [ -z "${mysql_root_password}" ]; then
  echo Input Password Missing
  exit 1
  fi

echo -e "\e[36m>>>>>> Copy MySQL Repo file <<<<<\e[0m"
cp mysql.repo /etc/yum.repos.d/mysql.repo &>>${log}
func_exit_status

echo -e "\e[36m>>>>>> disable MySQL 8 version <<<<<\e[0m"
yum module disable mysql -y &>>${log}
func_exit_status

echo -e "\e[36m>>>>>> Install MySQL Server <<<<<\e[0m"
yum install mysql-community-server -y &>>${log}
func_exit_status

echo -e "\e[36m>>>>>> Change Default password <<<<<\e[0m"
mysql_secure_installation --set-root-pass ${mysql_root_password} &>>${log}   #mysql_root_password=ExpenseApp@1
func_exit_status

echo -e "\e[36m>>>>>> Start MYSQL service <<<<<\e[0m"
systemctl enable mysqld &>>${log}
systemctl restart mysqld &>>${log}
func_exit_status
log=/tmp/expense.log
component=backend
source common.sh

echo -e "\e[36m>>>>>> Copy Backend service file <<<<<\e[0m"
cp backend.service /etc/systemd/system/backend.service &>>${log}
func_exit_status

echo -e "\e[36m>>>>>> Diasble nodejs and enable nodejs18 <<<<<\e[0m"
yum module disable nodejs -y &>>${log}
yum module enable nodejs:18 -y &>>${log}
func_exit_status

echo -e "\e[36m>>>>>> Install NodeJS <<<<<\e[0m"
yum install nodejs -y &>>${log}
func_exit_status

echo -e "\e[36m>>>>>> Add application User <<<<<\e[0m"
id expense &>>${log}
  if [ $? -ne 0 ]; then
    useradd expense &>>${log}
    fi
    func_exit_status

echo -e "\e[36m>>>>>> setup app directory <<<<<\e[0m"
mkdir /app &>>${log}
func_exit_status

echo -e "\e[36m>>>>>>Download the app code <<<<<\e[0m"
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip &>>${log}
cd /app &>>${log}
unzip /tmp/backend.zip &>>${log}
func_exit_status

echo -e "\e[36m>>>>>>  download the dependencies <<<<<\e[0m"
cd /app &>>${log}
npm install &>>${log}
func_exit_status

echo -e "\e[36m>>>>>> install mysql client <<<<<\e[0m"
yum install mysql -y &>>${log}
func_exit_status

echo -e "\e[36m>>>>>> Load Schema <<<<<\e[0m"
mysql -h mysql.manasareddy.online -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>${log}
func_exit_status

func_systemd
log=/tmp/expense.log
component=frontend
source common.sh
echo -e "\e[36m>>>>>> Install NGINX <<<<<\e[0m"
yum install nginx -y &>>${log}
func_exit_status

echo -e "\e[36m>>>>>> Copy NGINX conf <<<<<\e[0m"
cp nginx.conf /etc/nginx/default.d/expense.conf &>>${log}
func_exit_status

echo -e "\e[36m>>>>>>Remove the default content <<<<<\e[0m"
rm -rf /usr/share/nginx/html/* &>>${log}
func_exit_status

echo -e "\e[36m>>>>>> Download the frontend content <<<<<\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>${log}
func_exit_status

echo -e "\e[36m>>>>>> Extract the frontend content <<<<<\e[0m"
cd /usr/share/nginx/html &>>${log}
unzip /tmp/frontend.zip &>>${log}
func_exit_status

func_systemd


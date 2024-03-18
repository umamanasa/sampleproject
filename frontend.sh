log=/tmp/expense.log
echo -e "\e[36m>>>>>> Install NGINX <<<<<\e[0m"
yum install nginx -y &>>${log}
echo $?

echo -e "\e[36m>>>>>> Copy NGINX conf <<<<<\e[0m"
cp nginx.conf /etc/nginx/default.d/expense.conf &>>${log}
echo $?

echo -e "\e[36m>>>>>>Remove the default content <<<<<\e[0m"
rm -rf /usr/share/nginx/html/* &>>${log}
echo $?

echo -e "\e[36m>>>>>> Download the frontend content <<<<<\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>${log}
echo $?

echo -e "\e[36m>>>>>> Extract the frontend content <<<<<\e[0m"
cd /usr/share/nginx/html &>>${log}
unzip /tmp/frontend.zip &>>${log}
echo $?

echo -e "\e[36m>>>>>>Start Nginx service <<<<<\e[0m"
systemctl enable nginx &>>${log}
systemctl restart nginx &>>${log}
echo $?


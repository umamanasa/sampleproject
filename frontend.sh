echo -e "\e[36m>>>>>> Install NGINX <<<<<\e[0m"
yum install nginx -y



echo -e "\e[36m>>>>>> Remove the default content <<<<<\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[36m>>>>>> Download the frontend content <<<<<\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[36m>>>>>> Extract the frontend content <<<<<\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

#echo -e "\e[36m>>>>>> Create Nginx Reverse Proxy Configuration <<<<<\e[0m"
#vim /etc/nginx/default.d/expense.conf

echo -e "\e[36m>>>>>> Start & Enable Nginx service <<<<<\e[0m"
systemctl enable nginx
systemctl start nginx
echo -e "\e[36m>>>>>> Restart Nginx Service <<<<<\e[0m"
systemctl restart nginx











#Create Nginx Reverse Proxy Configuration.
#vim /etc/nginx/default.d/expense.conf
#
#Add the following content
#/etc/nginx/default.d/expense.conf
#
#proxy_http_version 1.1;
#
#location /api/ { proxy_pass http://localhost:8080/; }
#
#location /health {
#  stub_status on;
#  access_log off;
#}

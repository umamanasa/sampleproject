func_exit_status() {
if [ $? -eq 0 ]; then
 echo -e "\e[32m SUCCESS \e[0m"
 else
   echo -e "\e[31m FAILURE \e[0m"
   fi
}

func_systemd(){
  echo -e "\e[36m>>>>>> Start ${component} Service <<<<<\e[0m"
    systemctl daemon-reload &>>${log}
    systemctl enable ${component} &>>${log}
    systemctl restart ${component} &>>${log}
    func_exit_status
}



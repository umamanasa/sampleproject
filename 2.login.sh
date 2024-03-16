#shell script for login
#inputs
valid_username="manasa"
valid_password="manasa123"

#functional logic
func_login() {
  echo "Enter Username: "
  read username

  echo "Enter Password: "
  read -s password

  if [ "$username" == "$valid_username"  ] && [ "$password" == "$valid_password" ];
  then
    echo "Login Successful!"
    else
      echo "Login Unsuccessful!"
      echo "please try again!!"
      fi
}
func_login
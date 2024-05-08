rm -rf /tmp/expense.log
Heading(){
  echo -e "\e32m$*\e[0m"
}
Heading Installing the nginx server
dnf install nginx -y &>>/tmp/expense.log
echo exit status - $?

Heading Copying the expense file
cp expense.conf /ect/nginx/default.d/expense.conf &>>/tmp/expense.log
echo exit status - $?

Heading Deleting the previous content
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
echo exit status - $?

Heading Dowloading the frontend content
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log
echo exit status - $?
cd /usr/share/nginx/html


Heading Unzip the undowloaded content
unzip /tmp/frontend.zip &>>/tmp/expense.log
echo exit status -  $?

Heading Restarting the nginx
systemctl restart nginx
systemctl start nginx
echo exit status - $?


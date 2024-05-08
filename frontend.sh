rm -rf /tmp/expense.log

echo -e "\e[32mInstalling the nginx server\e[0m"
dnf install nginx -y &>>/tmp/expense.log
echo exit status - $?

echo -e "\e[32mCopying the expense file\e[0m"
cp expense.conf /ect/nginx/default.d/expense.conf &>>/tmp/expense.log
echo exit status - $?

echo -e "\e[35mDeleting the previous content\e[0m"
rm -rf /usr/share/nginx/html/* &>>/tmp/expense.log
echo exit status - $?

echo -e "\e[33m Dowloading the frontend content\e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip &>>/tmp/expense.log
echo exit status - $?
cd /usr/share/nginx/html


echo -e "\e[32mUnzip the undowloaded content\e[0m"
unzip /tmp/frontend.zip &>>/tmp/expense.log
echo exit status -  $?

echo -e "\e[32mRestarting the nginx\e[0m"
systemctl restart nginx
systemctl start nginx
echo exit status - $?


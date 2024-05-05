echo -e "/e[32mInstalling the nginx server/e[0m"
dnf install nginx -y

echo -e "/e[34m Copying the expense.conf file/e[0m"
cp expense.conf /ect/nginx/default.d/expense.conf

echo -e "/e[35m Deleting the previous content/e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "/e[33m Dowloading the frontend content/e[0m"
curl -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip

echo -e "/e[34m unzip the undowloaded content/e[0m"
unzip /tmp/frontend.zip

echo -e "/e[34m Restarting the nginx/e[0m"
systemctl restart nginx
systemctl start nginx



# 以下适用于MySQL8.0+

## 知道密码
	mysqladmin -uroot -poldpassword password newpassword
	或者
	mysql_secure_installation

## 忘记密码

	vim /etc/mysql/conf.d/mysql.cnf    //mysql 配置文件
		在[mysqld]后加入skip-grant-table    //跳过权限表
	mysql -uroot 
	flush privileges;
	alter user 'root'@'localhost'IDENTIFIED BY 'newpassword';    //8.0后推荐使用alter进行更改
    删除 skip=grant-table 

密码需要数字,大小写,字符(最后一个字符不要使用&)

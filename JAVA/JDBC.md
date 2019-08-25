*   JDBC使用步骤
    1.加载驱动程序  

>       加载驱动 Class.forName(drverClass)
        加载MySQL驱动 Class.forName("com.mysql.jdba.Driver");

    2. 获得数据库连接
        
>       DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/imooc","root","root");

    3. 创建Statement对象
    
>       conn.createStatement();

    

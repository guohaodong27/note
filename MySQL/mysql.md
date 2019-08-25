## MySQL Linux折腾日记
**一定到根据教程来**
初始化数据库 mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
注意服务是否启动,sysyemctl status mysql

* 更改密码

set password=password('wenzhu27');

* 授权访问

```text
在安装mysql的机器上运行： 

1、d:\mysql\bin\>mysql -h localhost -u root 

//这样应该可以进入MySQL服务器 

2、mysql>GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION 

//赋予任何主机访问数据的权限 

3、mysql>FLUSH PRIVILEGES 

//修改生效 

4、mysql>EXIT 

//退出MySQL服务器 
cp /usr/local/soft/mariadb/mariadb-10.2.9-linux-x86_64/support-files/mysql.server /etc/init.d/mysqld 
```

*  登录参数

| 参数 | 描述 |
|:------ |:------ |
|-D|打开指定的数据库|
|-h|主机名|
|-p|密码|
|-P|端口|
|-u|用户名|
  
  默认端口3306
* 创建数据库

>   CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name [DEFAULT] CHARACTER SET [=] charset_name

* 查看数据库

>   SHOW {DATABASES | SCHEMAS}

* 修改数据库

>   ALTER {DATABASE | SCHEMA} db_name [DEFAULT] CHARACTER SET [=] charset_name

* 删除数据库

>   DROP {DATABASE | SCHEMA| [IF EXIXTS] db_name


### 数据类型

* ineger
    * TINYINT,1
    * SMALLINT,2
    * MEDIUMINT,3
    * INT ,4
    * BIGINT,8
*  float 
    * FLOAT[(M,D)] M总位数,D小数点后的位数
    * DOUBLE[(M,D)]
* date
    * YEAR
    * TIME
    * DATE
    * DATETIME
    * TIMESTAMP
* char
    * CHAR(M) 
    * VARCHAR(M)
    * TINYTEXT
    * TEXT
    * MEDIUMTEXT
    * LONGTEXT
    * ENUM
    * SET

### 数据操作
*   打开数据库

>   USE db_name

*   创建数据表

>   CREATE TABLE [IF NOT EXISTS] table_name(字段1,字段2);

*   查看数据表内容

>   SHOW TABLES [FROM db_name]

*   查看数据表结构

>   SHOW COLUMNS FROM db_name

*   查看索引

>   SHOW INDEXES FROM db_name

*   插入记录

>   INSERT [INTO] tb_name [col_name] VALUES()
    
    INSERT [INFO] tb_name SET col_name={expr | DEFAULT}
    
    INSERT [INTO] tb_name [COLUMM](column) SELECT other_tb_name FROM col_name [WHERE]
*   记录查找

>   SELECT expr, FROM tb_name

*   更新记录

>   单表更新
    UPDATE [LOW_PRIORITY] [IGNORE] table_refernece SET col_name1={expr1 | DEFAULT } [,col_name2={expr2 |DEFAULT }][WHERE where_condition]   
    
    多表更新
    UPDATE table_references
    SET col_name1={expr1 | DEFAULT}
    [,col_name2={expr2 | DEFAULT}]
    [WHERE where_condition]

*   连接

>   table_reference [{INNER | CROSS} ] JOIN | {LEFT | RIGHT}[OUTER] JOIN} table_reference ON conditional_expr

*   删除记录
   
>   DELETE FROM tb_name [WHERE where_condition]

*   删除数据表

>   DROP TABLE tb_name

* 修改数据表

>   数据表更名
    
        ALTER TABLE tb_name RENAME [TO | AS] new_tb_name
    
        RENAME TABLES tb_name TO new_tb_name [,tb_name2 TO new_tb_name2]

#### 约束
>   创建数据表时可以加入约束

    *   空值,非空值

>   NULL 修饰符,可以为空
>   NOT NULL

*   主键

>   使用修饰符   PRIMARY KEY
>   主键默认是NOT NULL
>   主键允许赋值,但不允许两个相同的值

*   自动编号(必须与主键结合使用)  

>   AUTO_INCREMENT

*   唯一约束

>   唯一约束保证了数据的唯一性
    可以为空,只能有一个空
    可以有多个约束

>   UNIQUE KEY

*   外键约束

    * 父表和字表必须使用相同的存储引擎,而且禁用临时表
    * 数据表的存储引擎只能是InnoDB
    * 外键列和参照列必须有相似的数据类型,其中数字的长度或是否有符号位必须相同;而字符的长度则可以不同.
    * 外键列和参照列必须创建索引.如果外键列不存在索引,将会自动创建索引
    
>   [CONSTRAINT constraint_name] FOREIGN KEY foreign_key_name(children table column) REFERENCE parent_table(parent table column) ON DELETE action ON UPDATE action
>
>   FOREIGN KEY 指定字表引用父表中的列
    REFERENCE 指定父表在子表中的引用
    

*   外键约束的参照操作

>   CASCADE 父表更改,字表自动更改
    SET NULL 从父表删除或更新行,字表中更改为NULL(需要支持)
    RESTRICT 拒绝对父表的删除或更新
    NO ACTION 在MySQL中与RESTRICT相同

###     修改数据(表内咯到了)
    * 添加列

>   ALTER TABLE tb_name ADD [COLUMN] col_name column_definiton [FIRST | AFTER col_name]
    当没有位置选项时默认添加到最后
    ALTER TABLE tb_name ADD [COLUMN] (col_name1,col_name2,...)

    * 修改列
>   修改列定义
    ALTER TABLE tb_name MODIFY [COLUMN] col_name column_definiton [FIRST | AFTER col_name]
    
    修改列名称,定义
    ALTER TABLE tb_name CHANGE [COLUMN] old_col_name new_col_name column_definiton [FIRST | AFTER col_name]

    * 删除列
    
>   ALTER TABLE tb_name DROP [COLUMN] col_name

    * 添加约束
    
>   主键约束
    ALTER TABLE tb_name ADD [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name)
    
    唯一约束
    ALTER TABLE tb_name ADD [CONSTRAINT [symbol]] UNIQUE KEY [INDEX | KEY] [index_name][index_type] (index_col_name)
    
    外键约束
    ALTER TABLE tb_name ADD [CONSTRAINT[symbol]] FOREIGN KEY [index_name](index_col_name) reference_definition
    
    默认约束
    ALTER TABLE tb_name ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}

    * 删除约束
    
>   主键约束
    ALTER TABLE tb_name DROP PRIMARY KEY
    
    唯一约束
    ALTER TABLE tb_name DROP {INDEX | KEY } index_name
    
    外键约束
    ALTER TABLE tb_name DROP FOREIGN KEY fk_symbol


    
    
    


>   column_definiton 列定义(类型及其修饰)
>
>

*   SELECT 

>   SELECT 
    select_expr[,select_expr...]
    [
        FROM table_references
        [WHERE where_condition]
        [GROUP BY {col_name | position}[ASC | DESC],...]
        [HAVING where_condition]
        [ORDER BY {col_name | expr | position}[ASC | DESC],...]
        [LIMIT {[offset,] row_count|row_count OFFSET offset}]
    ]
    
    WHERE 查询列
    GROUP BY 分组列
    HAVING 分组依据
    ORDER BY 排序
    LIMIT 限制返回的数量 

## 函数
*   字符函数

>   1、countcat():字符连接；select concat('imooc','-','mysql') from db

>   2、countcat_ws():使用指定的分隔符进行字符连接;select concat_ws('|','A','B','C')

>   3、format()：数字格式化，返回一个字符串；select format(12345.67,2):小数点后保留两位

>   4、upper():字符大写；

>   5、lower():字符小写；

>   6、left():获取左侧字符；

>   7、right():获取右侧字符；

>   8、length():获取字符串长度；

>   9、ltrim():删除前导空格；rtrim():删除后续空格；trim():删除前导及后续空格；select trim(leading '?' from '??mysql???'):删除前导的‘？’
select trim(trailing '?' from '??mysql???'):删除后续的‘？’
select trim(both '?' from '??mysql???'):删除所有的‘？’，但是无法删除中间的‘？’，需要使用replace()函数
replace('??my??sql???','?'," ")

>   10、substring():截取字符串
substring('mysql',1,2):从第1位取2位，起始为hi也可以为负值，但长度不能为负值

>   11、like:模式匹配
在mysql中，%代表任意多个字符，_代表任意一个字符。
使%或者_不为通配符的方法：
select * from test where first_name like '%1%%' escape '1':1后面的%不在为通配符，而是代表%

*   数值函数

>1、ceil():向上取整；floor():向下取整

>2、div:整数除法；select 3 div 4 结果为0

>3、mod:取余数，等价于% select 3 %/mod 4，结果为3 也可对浮点数取余数。如select 3.5 % 3 结果为0.5

>4、power():幂运算

>5、round():四舍五入，取小数位数

>6、truncate():取小数位数，但不四舍五入，数字截取

*   信息函数

>1、connection_id():返回连接的ID

select connection_id();

>2、database():当前数据库；

>3、last_insert_id():最后插入记录的ID号
必须具备自动编号的字段；当一次性插入多条记录时，只返回插入的第一条记录的id号

>4、user():当前用户

>5、version():版本信息

*   时间函数

>1、now():当前日期和时间；

>2、curdate():当前日期；

>3、curtime():当前时间；

>4、date_add():日期变化，可以增加也可以减少
select date_add('2014-3-12',interval 3 week\2 year\365 day\5 month)

>5、datediff():日期差值的计算

>6、date_format():日期格式化

*   比较函数

>1、[not] between……and……：[不]在范围之内

>2、[not] in ():[不]在列出值范围之内

>3、is[not] null :[不]为空

*   聚合函数

>1、set names gbk:改变编码格式

>2、count():计数

>3、avg():求平均值

>4、max():求最大值

>5、min():求最小值

>6、sum():求和

*   自定义函数

>CREATE FUNCTION  f-name(parameter-list) RETURN return-index_type
>1、delimiter //:代表以后所有的MySQL命令都要以'//'结束

>2、 create function adduser(username varchar(20))
    returns int unsigned
    begin
    insert test(username) values(username);
    return last_insert_id();
    end
    //

>3、drop function function_name

*   存储过程

>1、1、创建存储过程
    
    CREATE
    [DEFINER={user|CURRENT_USER}]
    PROCEDURE sp_name([proc_paremeter[,…]])
    [characteristic…] routine_body
    proc_paremeter:
    [IN|OUT|INOUT]param_name type
    
    2、in:表示该参数的值必须在调用存储过程时指定；
    out:表示该参数的值可以被存储过程改变，并且可以返回；
    inout:表示该参数在调用时指定，并且可以被改变和返回
    
    3、特性
    COMMENT:注释
    CONTAINS SQL:包含sql语句，但不包含读或者写数据的语句；
    NOT SQL：不包含sql语句；
    READS SQL DATA:包含读数据的语句；
    MODIFIES SQL DATEA:包含写数据的语句；
    SQL SECURITY{DEFINER|INVOKER}:指明谁有权限连执行
    
    4、过程体
    （1）过程体由合法的sql语句构成；
    （2）过程体可以是任意的sql语句；
    （3）过程体如果为复合结构则使用begin_end语句；
    （4）复合结构可以包含声明、循环、控制结构
>2、调用存储过程
    （1）CALL sp_name([parameter[,…]])
    （2）CALL sp_name[()]


## JDBC

**虽然是废话,但是包去官网下载这是原则问题**

### PROCEDURE
**不能call procedure() procedure()**
click [here](https://www.cnblogs.com/zengjiao/p/6853873.html) for more information

* 调用PROCEDUCE

CallableStatement calableStatement = connection.prepareCall(sql)

> sql表示"CALL procedure_name()"  **注意没有分号**

* 赋值方法

calableStatement.setXXX();

* 执行语句


calableStatement.execute(); [无参]
calableStatement.executeQuery();    [有参]

* 取值方法

    * 结果集

>   ResualtSet resualtSet = calableStatement.getResultSet();
    while(resualtSet.next()){
    resualtSet.getXXX();
    }

    * 出参
    
>   需要注册
    calableStatement.registerOutParameter(index,Types.XXX)
    需要更新
    calableStatement.execute();
    当调用的时候,String string = getSting(index);

```java
/**
         * 调用存储过程
         */

//       有参无返回值
        /*CallableStatement callableStatement = connection.prepareCall ( "call del(?)" );
        callableStatement.setInt ( 1,1);
        callableStatement.execute ();
*/

//       有参返回结果集/出参
//        String sqlCall = "call ls()";
        CallableStatement callableStatement = connection.prepareCall ( "call refer(3,?,?)");



//        出参
        try {
//            出参需要注册
            callableStatement.registerOutParameter ( 2,Types.CHAR );
            /*execute,executeQuery,executeUpdate的区别
            * execute   执行任意SQL语句
            * executeQuery  执行DQL
            * executeUpdate     执行DDL*/
            callableStatement.executeUpdate();
//            callableStatement.executeQuery ();
//            callableStatement.execute ();
            System.out.println (callableStatement.getInt ( 1 ));

        } catch (SQLException e) {
            e.printStackTrace ();
            callableStatement.executeQuery ();
        }

        //      结果集

            callableStatement.execute ();
            ResultSet resultSet = callableStatement.getResultSet ();
        while(resultSet.next ()){
            System.out.println (resultSet.getString ( "money" ));
            System.out.println (resultSet.getString ( "name" ));
        }
        
```

    
    

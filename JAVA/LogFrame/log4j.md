# log4j日志框架

## 导入[依赖](https://mvnrepository.com/artifact/log4j/log4j)

```xml
<!-- https://mvnrepository.com/artifact/log4j/log4j -->
<dependency>
    <groupId>log4j</groupId>
    <artifactId>log4j</artifactId>
    <version>1.2.17</version>
</dependency>

```

## 定义配置文件

```xml

log4.rootLogger = [level ] ,appenderName, appenderName, ...

```

> level 是日志的等级,分别为{OFF,FATAL,ERROR,WARN,INFO,DEBUG,ALL}建议使用E,W,I,D四个级别

##　配置日志信息的输出目的地Appender

```xml
log4j.appender.appenderName = fully.qualified.name.of.appender.class
log4j.appender.appenderName.optionl = value1
...
log4j.appender.appenderName.option = valueN
```

	Log4j提供的appender
```properties
org.apache.log4j.ConsoleAppender（控制台），  
org.apache.log4j.FileAppender（文件），  
org.apache.log4j.DailyRollingFileAppender（每天产生一个日志文件），  
org.apache.log4j.RollingFileAppender（文件大小到达指定尺寸的时候产生一个新的文件），  
org.apache.log4j.net.SMTPAppender(邮件)
org.apache.log4j.DailyRollingFileAppender(每天一个日志文件)
org.apache.log4j.WriterAppender（将日志信息以流格式发送到任意指定的地方）
```
**Log4j提供的option**
|option|描述|
|---|---|
|File|日志文件路径|
|Threshold|appender的阀值(级别)|
|layout|布局|
|Append|是否自动追加|
|DatePattern|时间戳|

**Log4j可以设置appender的格式**
|字符|格式说明|
|---|---|
|%c|输出日志信息所属的类的全名|
|%d|输出日志时间点的日期或时间,可以定义格式%d{yyyy-MM-dd HH:mm:ss}|
|%f|输出日志信息所属的类的类名|
|%m|输出代码中指定的信息,如log(message)中的message|
|%l|输出日志事件发生的位置|
|%n|换行|
|%p|输出优先级|
|%r|输出应用启动到输出日志所耗费的毫秒数|
|%t|输出产生该日志的线程名|


## 配置日志信息的布局(格式)

```xml
log4j.appender.appenderName.lauout = fully.qualified.name.of.layout.class
log4j.appender.appenderName.layout.option1 = value1
...
log4j.apppender.appernderName.layout.option = valueN
```

	Log4j提供的layout

```properties
org.apache.log4j.HTMLLayout（以HTML表格形式布局），  
org.apache.log4j.PatternLayout（可以灵活地指定布局模式），  
org.apache.log4j.SimpleLayout（包含日志信息的级别和信息字符串），  
org.apache.log4j.TTCCLayout（包含日志产生的时间、线程、类别等等信息）
```
## 在代码中使用log4j

1. 得到记录器

```java
public static Logger getLogger(String name)
//一般使用本类的名字
public static Logger logger = Logger.getLogger(ServerWithLog4h.class.getName())
```

2. 进行配置

```java
BasicConfigurator.configure();(默认配置)
PropertyConfigurator.configurel(String filePath)
```

3. 使用logger

##　web工程

在servlet容器中初始化log4j
[参考](https://blog.csdn.net/u013870094/article/details/79518028)

```xml
<!--用来启动 log4jConfigLocation的servlet -->  
    <servlet>  
        <servlet-name>Log4JInitServlet</servlet-name>  
        <servlet-class>com.mucfc.Log4JInitServlet</servlet-class>  
        <init-param>  
            <param-name>log4j-properties-location</param-name>  
            <param-value>/WEB-INF/classes/log4j.properties</param-value>  
        </init-param>  
        <load-on-startup>1</load-on-startup>  
    </servlet>  

    <servlet-mapping>  
        <servlet-name>Log4JTestServlet</servlet-name>  
        <url-pattern>/test</url-pattern>  
    </servlet-mapping>  
```

---
## 随手记

1. 输出有日期的log文件

```properties
log4j.appender.C.DatePattern=yyyy-MM-dd'.log'
```
当天的日志不显示日期

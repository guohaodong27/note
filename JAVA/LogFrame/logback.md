# logback

## 定义配置文件

```xml
<configuration>
<!-- 设置STDOUT为ConsoleAppender -->
	<appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
		<encoder>
			<pattern>%d{HH:mm:ss.SSS} [%thread] %-5leven %logger{36} - %msg%n</pattern>
		</encoder>
	</appender>
<root level="debug">
	<appender-ref="STDOUT"/>
<root>	
<configuration>
```

## 自定义输出

|表示符|描述|
|---|---|
|%M|输出当前日志所在的方法|
|%msg|输出消息(输入的字符串)|
|%blod|加粗|
|%d|日期|


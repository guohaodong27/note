+ Servlet装载顺序

>constructor->
 init->
 doget->
 distroy

> 自动装载 <loadon-startup>

+ Servlet获取表单数据

>使用<form action="class">
checkbox使用getParammeterValues()

>绝对路径使用  <%=path%>访问
>在jsp页面中的/表示服务器的根目录

+   初始化参数(web.xml)

```jsp
<servlet>
    <init-param>
        <param-name>参数名</param-name>
        <param-value>参数值</param-value>
    </init-param>
</servlet>
```


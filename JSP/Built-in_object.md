+ out

> javax.servlet.jsp.JspWriter 的实例，用于在响应中发送内容

    + print()，println(),flush()
    + flush使用后不能print，flush后会输出缓冲区的所有内容
    + 可能会抛出 IOExceptions

+ [request](https://www.yiibai.com/jsp/jsp_client_request.html)

>javax.servlet.http.HttpServletRequest 的实例，每当请求一个页面时，创建一个对象表示该请求

    + getParameter(String s)获取表单
    + Enumeration getAttributeNames()可用属性名称
    + getSession([boolean create]) 返回当前会话create为true若没有自动创建
    + getAttribute(String name) 返回属性值
    + setAttribute(String name , Object value)
    + getDispatcher(String s).forward(request,response)
    + setCharacterEncoding(String s) inherited from javax.servlet.ServletRequest

+ [response](https://www.yiibai.com/jsp/jsp_server_response.html)

>javax.servlet.http.HttpServletResponse 的实例，创建一个对象表示对客户端的响应

    + sendRedirect("String s") 重定向
    + setCharacterEncoding(String s) inherited from javax.servlet.ServletRequest

+ session

>javax.servlet.http.HttpSession的一个实例，其行为与Java Servlet下的会话对象行为完全相同。

    + getCreationTime() 返回session创建epoch时间
    + getId() 
    + setAttribute(String name,Object value)
    + invalidate()
    + setMaxInactiveInterval(int interval)

+ application

>javax.servlet.ServletContext 对象的一个实例 JSP页面被初始化时创建

    + setAttribute
    + jspDestory()
    
+ config

>javax.servlet.ServletConfig 访问初始化参数，路径，文件位置等

+ pageContext

>javax.servlet.jsp.PageContext对象的一个实例。pageContext对象用于表示整个JSP页面。

+ page

>相当于this

+ exception

>异常处理

+ 要设置错误页面，请使用<%@ page errorPage =“xxx”%>

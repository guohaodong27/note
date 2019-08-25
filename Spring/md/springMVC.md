# springMVC
# Q&A
1. 设置RequestMapping的时候"/url"与"url"有区别吗?

    A:没有区别
2. 如何传输json数据

    A:receive JSON :
    将如下写入参数列表
    @RequestBody String json
    sent JSON:
    在方法前加入
    @ResponseBody
    返回值为JSON
    
3. 如何传输地址参数

    A:在地址栏写入EL表达式
    "url/{param}
    @PathVariable
4. 报异常The origin server did not find a current representation for the target resource or is not willing to disclose that one exists.

    A:在dispatcher-xxx.xml文件中添加
    <context:compontent-scan base-package = "{yourPackage}">
    
    //如果没有该命名空间
    
    //xmlns:context="http://www.springframework.org/schema/context"
    
    // **xsi**http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context.xsd
    
5. 

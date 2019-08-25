# springCore
## Ioc
## Aop
* 代理的作用

>客户端代码有一个对代理的引用:该对象引用的方法调用将是代理上的调用,代理将委托给拦截器(与特定方法调用相关的)

**若不是AspectJ则上述方法会导致自我调用应该加入如下代码以暴露AOP代理对象**

```java
factory.setExposePorxy(true)
```
* 使用XML配置AOP
```xml
<!-- 所有的AOP都在config标签内 -->
<aop:config>
<!-- 声明aspect -->
    <aop:aspect id="xxx" ref="xxx">
<!-- 定义pointcut -->
        <aop:pointcut id="xxx" expression="execution()"/>
<!-- 定义处理方法 -->
        <aop:{advice_name} pointcut-ref="" method="">
    </aop:aspect>
</aop:config>
[from:易百教程](https://www.yiibai.com/spring_aop/springaop_implementations.html)



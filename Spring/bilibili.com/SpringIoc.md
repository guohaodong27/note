## 配置applicationContext
* 配置文件实例

```xml

<!-- 配置自动扫描 -->
<context:component-scan base-package="com.tyut"/>
<!-- 声明一个bean 注入(property)-->
<!-- 也可以使用p命名空间 -->
<bean id="propertyConfigurer" class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
        <property name="location" value="classpath:jdbc.properties"/>
        <property name="fileEncoding" value="utf-8"/>
</bean>
<!-- 使用java.util.Properties实例 -->

<!--导入jdbc.properties配置文件-->
<bean id="propertyConfigurer" class="org.springframework.beans.factory.config.PropertyPlaceholderConfigurer">
    <property name="location" value="classpath:jdbc.properties"/>
    <property name="fileEncoding" value="utf-8"/>
</bean>
<bean id="dataSource" class="com.alibaba.druid.pool.DruidDataSource" init-method="init" destroy-method="close">
        <!-- 基本属性 url、user、password、driverClass -->
        <property name="username" value="${jdbc.username}" />
        <property name="password" value="${jdbc.password}" />
        <property name="driverClassName" value="${jdbc.driverClass}" />
        <property name="url" value="${jdbc.url}" />
</bean>
<!-- 声明一个bean 注入(constructor-arg) -->
<!-- 也可以使用c命名空间 -->
<bean id="sqlSessionFactoryTemplate" class="org.mybatis.spring.SqlSessionTemplate">
        <constructor-arg ref="sqlSessionFactory"/>
</bean>

<!-- 使用depends-on -->
<!-- depends-on可以强制提前实例化依赖bean -->
<!-- fastJson使用时需要调用静态方法 -->
<bean id="fastJson" class="com.alibaba.fastjson.JSON" abstract="true"/>
<bean id = "print" class="Print" depends-on="fastJson"/>

<!-- 延迟加载 -->
<!-- lazy-init="true" -->
```

|注解|功能|
|:---|:---|
|@Configuration|声明该类是配置类|
|@ComponentScan|启动自动扫描|
|@EnableAutoConfiguration|自动装配|
|@SpringBootApplication|@EnableAutoConfiguration,@ComponentScan,@Configuration|
|@Import|导入需要的配置类|
|@Bean|声明一个bean|
|@Scope|定义bean的scope|
|@PropertySource|将properties文件引入spring|


## 常用API

1. BeanFactory 用于生成任意bean
2. ApplicationContext BeanFactory的子接口通常用来实例化bean
3. ClassPathXmlApplicationContext用于加载ClassPath(类路径下的xml)
4. FileSystemXmlAppllicationContext用于加载制定盘符下的XML
5. AnnotationConfigApplicationContext用于加载application配置类

## junit整合spring container

> junit自身集成main函数不能修改,所以junit不会初始化spring container
因此不能使用@Autowired自动织入

* 解决方法
    1. @RunWith(SpringJUnit4ClassRunner.class)从而初始化spring container
    2. @ContextConfiguration([location="*.xml"|class="*.class"])设置配置文件/类 




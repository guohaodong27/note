# mybatis-generator

## 添加依赖
```xml
<dependency>
    <groupId>com.baomidou</groupId>
    <artifactId>mybatis-plus-generator</artifactId>
    <version>3.1.2</version>
</dependency>
```
## 添加模板引擎

1. velocity-engine-core
2. freemarker
3. beetl

> 选择2,3需要在AutoGenerator中设置

## 编写配置

1. 配置GlobalConfig
```java
GlobalConfig globalConfig = new GlobalConfig();
//输出目录,一般为java
globalConfig.setOutputDir(System.getProperty("user.dir") + "/src/main/java");
//作者
globalConfig.setAuthor("jobob");
//
globalConfig.setOpen(false);
```
2. 配置DataSourceConfig

```java
DataSourceConfig dataSourceConfig = new DataSourceConfig();
dataSourceConfig.setUrl("jdbc:mysql://");
dataSourceConfig.setDriverName("com.mysql.cj.jdbc.Driver");
dataSourceConfig.setUsername("root");
dataSourceConfig.setPassword("password");
```

3. 如果需要自定义模板引擎:extend:com.baomidou.mybatisplus.generator.engine.AbstractTemplateEngine




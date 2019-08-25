# Index
## 特点

1. 可以以jar包的形式独立运行
2. 内嵌Servlet容器,无需以war包的形式部署项目
3. 简化maven的配置
4. 会根据在类路径中的jar包,类为jar包中的类自动配置bean
5. 提供了给予http,ssh,telnet对运行时项目进行监控
6. 使用注解而不是XML

## 原理解析

### @SpringBootConfiguration
@Configuration
@ComponetScan
@EnableAutoConfiguration
@Import({AutoConfigurationImportSelector.class})

### spring-boot-autoconfigure
其中spring-configuration-metadata.json记录了配置的名称,类

### [热部署](热部署.md)

### [SpringBootLOVEMybatis](SpringBootLOVEMybatis.md)

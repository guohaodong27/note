# SpringBootLOVEMybatis

## 添加依赖

1. mybatis-spring-boot-starter
2. mysql-connnector

## 配置文件

```yaml
spring:
	datasource:
		driver-class-name: com.myslq.cj.jdbc.Driver
		url: 
		username:
		password:
```

## 指定MapperScan

> 在配置类中使用@MapperScan注解可以代替**在每一个方法上写@Mapper注解**

```java
@SpringBootApplication // @Configuration
@MapperScan("[mapper's path]")
/**
*launch SpringBoot
*/
```

## 编写Mapper接口

```java
public interface UserMapper{

/**
* 查询所有信息
* @return 人员列表
*/

@Select("SELECT * FROM user")
@Results({
		@Result(property = "userName",column = "user_name"),
		@Result(property = "password", column = "password")
})
List<UserDo> findAll();
```

## 测试程序

1. Service
```java
@Service public class UserServiceImpl implements IUserService { 
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<UserDO> findAll(){
		return userMapper.findAll();
	}
```
2. Controller

```java
@RestController
@RequestMapping(value = "/user")
public class UserConrtoller{
	
	@Autowired
	private IUserService userService;

	@RequesrMapping(value = "findAll")
	public List<UserDO> findAll(){
		return userService.findAll();
	}
```
---

# SpringBootLOVEMybatis-plus

## 添加依赖
1. mybatis-plus-boot-starter
2. velocity
3. freemarker

## 配置文件
```yaml
mybatis-plus:
	configuration:
		log-impl: org.apache.ibatis.logging.stdout.StdOutImpl
```

## 代码生成器
```java
public class MpGenerator {
   public static void main(String[] args) {
       GlobalConfig config = new GlobalConfig();
       String dbUrl = "jdbc:mysql://localhost:3306/viboot?useSSL=false";
       DataSourceConfig dataSourceConfig = new DataSourceConfig();
       dataSourceConfig.setDbType(DbType.MYSQL)
               .setUrl(dbUrl)
               .setUsername("root")
               .setPassword("Passw0rd")
               .setDriverName("com.mysql.cj.jdbc.Driver");
       StrategyConfig strategyConfig = new StrategyConfig();
       strategyConfig
               .setCapitalMode(true)
               //这里结合了Lombok，所以设置为true，如果没有集成Lombok，可以设置为false
               .setEntityLombokModel(true)
               .setNaming(NamingStrategy.underline_to_camel);
       //这里因为我是多模块项目，所以需要加上子模块的名称，以便直接生成到该目录下，如果是单模块项目，可以将后面的去掉
       String projectPath = System.getProperty("user.dir") + "/viboot-mybatis-plus";
       // 自定义配置
       InjectionConfig cfg = new InjectionConfig() {
           @Override
           public void initMap() {
           }
       };
       // 如果模板引擎是 freemarker
       String templatePath = "/templates/mapper.xml.ftl";
       // 如果模板引擎是 velocity
       // String templatePath = "/templates/mapper.xml.vm";

       // 自定义输出配置
       List<FileOutConfig> focList = new ArrayList<>();
       // 自定义配置会被优先输出
       focList.add(new FileOutConfig(templatePath) {
           @Override
           public String outputFile(TableInfo tableInfo) {
               // 自定义输出文件名
               return projectPath + "/src/main/resources/mapper/" + "user"
                       + "/" + tableInfo.getEntityName() + "Mapper" + StringPool.DOT_XML;
           }
       });

       cfg.setFileOutConfigList(focList);

       //设置作者，输出路径，是否重写等属性
       config.setActiveRecord(false)
               .setEnableCache(false)
               .setAuthor("viyoung")
               .setOutputDir(projectPath + "/src/main/java")
               .setFileOverride(true)
               .setServiceName("%sService");
       new AutoGenerator()
               .setGlobalConfig(config)
               .setDataSource(dataSourceConfig)
               .setStrategy(strategyConfig)
               .setTemplateEngine(new FreemarkerTemplateEngine())
               .setCfg(cfg)
               //这里进行包名的设置
               .setPackageInfo(
                       new PackageConfig()
                               .setParent("indi.viyoung.viboot.mybatis")
                               .setController("controller")
                               .setEntity("entity")
                               .setMapper("mapper")
                               .setServiceImpl("service.impl")
                               .setService("service")
               ).execute();
   }
}
```

## 条件构造器

```java
@Override
public User findByUserName(String userName) {
	QueryWrapper<User> wrapper = new QueryWrapper<>();
	wapper.lambda().eq(User::getUserName,userName);
	return userMapper.selectOne(wrapper);
}
```
## 分页查询

1. 使用Mybatis-Plus的分页插件
```java
@Bean
public PaginationInterceptor paginationInterceptor() {
	return new PaginationInterceptor();
}
```

2. 使用分页
```java
@RequextMapping("")
public IPge<User> findAllByPage(){
	Page<User> userIPage = new Page<>(1,10);
	return userService.page(userIPage);
}
```
> 只需使用一个Page对象,并初始化我们所需要的页数(page)和每页的数据量(pageSize)


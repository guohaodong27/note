# SpringLOVEJUnit

## 导入依赖

1. junit
2. spring-test

## 创建测试类

```java
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration()		//加载配置文件

@Transactional
@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)

```

# AOP

> AOP类使用@Aspect注解修饰
## 切点声明(Declaring a Point)

### 切点表达式

1. execution(modifiers-pattern? ret-type-pattern declaring-type=pattern? name-pattern(parm-pattern) throws-pattern?)

> execution细粒度为方法(可以精确到method)
> 问号表示当前项可以没有
	
|选项|语义|
|---|---|
|modifiers-pattern|权限修饰符|
|ret-type-pattern|返回值类型|
|declaring-type-pattern|方法所在类的全路径名|
|name-pattern|方法名|
|param-pattern|方法参数类型|
|throws-pattern|抛出的异常类型|

> 可以使用[Limited wildcard](../../Linux/wildcardANDregex.md)
> param-pattern需要写全类名eg:java.lang.String

> execution(\* com.spring..\*.businessService())
> ..表示对spring路径的延续

2. within(declaring-type-pattern)

> within细粒度为类,指定后该类所有方法都会加入切点

3. args

> args匹配指定参数类型/数量的方法,无论路径/方法名

> 只能使用..通配符

4. \[this/target](declaring-type-pattern)

> this:代理生成的对象符合指定类型
> target:实现指定接口的类

**由于代理方式的原因**

```text
this(SomeObject)或target(SomeObject)，这里SomeObject实现了某个接口：对于这种情况，虽然表达式中指定的是一种具体的对象类型，但由于其实现了某个接口，因而Spring默认会使用Jdk代理为其生成代理对象，Jdk代理生成的代理对象与目标对象实现的是同一个接口，但代理对象与目标对象还是不同的对象，由于代理对象不是SomeObject类型的，因而此时是不符合this语义的，而由于目标对象就是SomeObject类型，因而target语义是符合的，此时this和target的效果就产生了区别；这里如果强制Spring使用Cglib代理，因而生成的代理对象都是SomeObject子类的对象，其是SomeObject类型的，因而this和target的语义都符合，其效果就是一致的。
```
4. @within

> 匹配带有指定注解的类

5. @annotation

> 匹配带有指定注解的方法

## 通知声明(declaring advice)

1. @Before([pointcut-expression|signature])
2. @AfterReturning([pointcut-expression|signature])

可以通过指定returning属性获得返回对象
3. @AfterThrowing([pointcut-expression|signature])
	
可以通过指定throwing属性获得异常对象
4. @After([pointcut-expression|signature])

通常用于释放内存
5. @Around([pointcut-expression|signature])

方法的第一个参数必须是ProceedingJoinPoint对象,函数中必须调用proceed()方法
*在调用proceed()方法前程序相当于停止,类似开启调试*

## 通知参数

1. 获取当前方法信息[JoinPoint](https://www.eclipse.org/aspectj/doc/released/runtime-api/org/aspectj/lang/JoinPoint.html)
2. 获取参数需要匹配出有所需参数的目标方法
	1. 使用&& args(account,..) 
	2. 使用带参数的方法signature(account)
3. 通过接口中的方法获取值

```java
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface Auditable {
    AuditCode value();
}
```
```java
@Before("com.xyz.lib.Pointcuts.anyPublicMethod() && @annotation(auditable)")
public void audit(Auditable auditable) {
    AuditCode code = auditable.value();
    // ...
}
```

## 通知顺序(Ordering)

> 如果没有优先级,顺序不确定

### 设置优先级

1. 通知类实现org.springframework.core.Ordered接口
2. 使用Order注解



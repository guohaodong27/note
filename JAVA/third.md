+   异常
    Exception类
    + 捕获异常
    ```java
    try{
    //假装有程序
    }catch(异常类型 对象名)
    {
    //catch块
    }
    ```
    + 抛出异常
    
    pubilc void draw() throws exception类型
    thorw 异常对象;
    
    + finally关键字
    
    无论是否发生异常,finally代码块中的一定会被执行
    
+   包装类
    int->Integer
    + 方法
            1. 转换为基本数据类型(Integer Object并没有改变,只是返回一个某一数据类型的值) : 数据类型Value
            2. toString()
            3. parseInt(String s) String->int
            4. valueOf(String s) String->Integer
    + 基本类型和字符串的转换
        + 转为字符串
                1. Integer.toString(String s)
                    **对于scanner.nextInt()不适合,由于返回值是基本数据类型而不是Object**
                2. String.valueOf()
        + 转为基本数据类型
                1. Integer.parseInt(str)
                2. Integer.valueOf(str)
    + 拆箱,装箱

```java
    public class HelloWorld {
    public static void main(String[] args) {
        
        // 定义double类型变量
		double a = 91.5;
        
         // 手动装箱(构建一个包装类的对象)
		Double b = new Double(a);
        
        // 自动装箱
		Double c = a;       

        System.out.println("装箱后的结果为：" + b + "和" + c);
        
        // 定义一个Double包装类对象，值为8
		Double d = new Double(87.0);
        
        // 手动拆箱(使用Value取值)
		double e = d.doubleValue()  ;
        
        // 自动拆箱
		double f = d;
        
         System.out.println("拆箱后的结果为：" + e + "和" + f);
	}
}
```
    
+   Date类(java.util)
+   [SimpleDateFormat类()](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/text/SimpleDateFormat.html)

    *注意使用SimpleDateFormat()时注意构造方法*
    + Obj.fotmat(Date date)
    + Obj.parse(String str)
    
    *使用parse时有可能ParseException异常,需要异常处理*
    
+   [Math类](https://docs.oracle.com/en/java/javase/11/docs/api/java.base/java/lang/Math.html)
        *Math类中都是static方法*
        **floor(),ceil()返回值是double!!!**
+   集合框架Collection接口
        + List(接口)使用ArrayList()实例化
        + ListObj.addAll(Array.asList(Array array))
        + 通过迭代器遍历集合
```java
        public void testIterator(){
        Iterator it = courseToSelect.iterator();
        while(it.hasNext()){
                Course cr = (Course)it.next();
        }
        }
```
        + 使用foreach遍历
        + 修改set(int index,Object obj)
        + 获取get(int index)
        + 添加add([int index],Object obj)
        + 删除remove(Object obj)
        + 判断是否包含contains(Object obj)
        + 查询索引indexOf()
        + collection排序Collection.sort()

>       需要重写equals,hashcode方法
>       实现非包装类及非String类的排序需要写comparable,comparator方法

+   泛型(限定集合的数据类型)
        *List<数据类型>*
        *实例化对象时也要使用泛型限定*
+   集合框架Map接口
        + Map(接口)使用HashMap()/TreeMap()实例化
        + 添加/修改put(K key,V value)
        + 删除remove(K key)
        + 是否含有containsKey(K key),containValue(V value)
        + 遍历

```java
        /**
	 * 测试Map的keySet方法
	 */
	public void testKeySet() {
		// 通过keySet方法，返回Map中的所有“键”的Set集合
		Set<String> keySet = students.keySet();
		// 取得students的容量
		System.out.println("总共有：" + students.size() + "个学生！");
		// 遍历keySet，取得每一个键，再调用get方法取得每个键对应的value
		for (String stuId : keySet) {
			Student st = students.get(stuId);
			if (st != null)
				System.out.println("学生：" + st.name);
		}
	}
```

```java
        /**
	 * 通过entrySet方法来遍历Map
	 */
	public void testEntrySet() {
		// 通过entrySet方法，返回Map中的所有键值对
		Set<Entry<String, Student>> entrySet = students.entrySet();
		for (Entry<String, Student> entry : entrySet) {
			System.out.println("取得键：" + entry.getKey());
			System.out.println("对应的值为：" + entry.getValue().name);
		}
	}
```

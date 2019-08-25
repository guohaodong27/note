# Redux LOVE  JAVA

## Redux核心概念

|JAVA|Redux|描述|官方描述|
|---|---|---|---|
|函数式编程(lambda)|Reducer|输入->输出(对值/状态的一种更新)|更新状态(state)值|
|pojo类|Action|纯对象\{type:""[,payload:""]}^_^//剩下的三个都是方法(函数)||
|[Factory模式](https://www.w3cschool.cn/java/java-factory-pattern.html)|Action Creator|创建一个对象(@P type),管道化到应用程序state=>会让react组件全部重新渲染|
|redis/mysql|Store|持久层,做存贮(Store本身就是存储的意思)|


## 相关概念
|JAVA|Redux|描述|
|---|---|---|
|data(RestFulAPI)|payload|承载数据的**对象**|
|dispatch|dispatch|springMVC:对请求的分发,Redux:像store分发action|

1.  store duties:获取状态(get方法),设置状态dispatch(action)(set方法),监听,保持状态
2. redux数据流动(data flow)严格单向
3.  redux数据生命周期(data lifecycle)
	1. 调用dispatch
	2. 调用root reducer
	3. 合并到状态树

### Java lambda
```java
(a)->a*2
```
### Action Creator
```javascript
export function addTodo({ task }) {
  return {
    type: 'ADD_TODO',
    payload: {
      task,
      completed: false
    },
  }
}
```

### Reducer

```javascript
//此处可以使用箭头表达式
export default function(state = initialState, action) {
  switch (action.type) {
  //前面指定的type在这里
    case 'ADD_TODO':
      const newState = [...state, action.payload];
      return newState;

    // 可以使用更多的case(手动滑稽)

    default:
      return state;
  }
}
```

### Store

```javascript

```
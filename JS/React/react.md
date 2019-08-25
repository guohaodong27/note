# React

## JSX

1. 创建一个元素(对象)
	React.crateElement()
2. 创建一个组件

```javascript
class MyComponent extend React.Component{
    render(){
		return <h1>hello{this.props.name}</h1>
    }
}
```
> 组件名必须大写

3. 渲染组件

```javascript
ReactDOM.render(element,document.getElementById("root"))
```

4. state/生命周期
	state 是组件私有的
	1. componentDidMount()	//组件被渲染后运行(类似构造函数)
	2. componentWillUnmount()	//组件将被卸载运行(类似析构函数)

```javascript
componentDidMount(){
	this.timeID=setInterval(()=>this.tick(),1000);
}
```

5. es6 class的构造函数
```javascript
constructor(props){
	surper(props);//调用父类的构造方法
	this.state = {date:new Date()}
}
```

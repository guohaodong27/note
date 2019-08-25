# SpringBootLOVESwagger

## 导入依赖

1. springfox-swagger2
2. springfox-swagger-ui

## 配置文件

```java
@Configuration
@EnableSwagger2
public class Swagger2Configuration{
	
	@Bean
	public Docket createRestApi(){
		return new Docket(DocumentationType.SWAGGER2)
			.apiInfo(apiInfo())
			.select()
			.apis(RequestHandlerSelectors.withClassAnnotation(Api.class))
			.paths(PathSelector.any())
			.build();
	}
	
	pirvate ApiInfo apiInfo(){
		return new ApiInfoBuilder()
			.title("课外科技竞赛接口文档")
			.description("")
			.termsOfServiceUrl()
			.build();
	
}

# Docker

## container(容器)

1. dockerFile(定义容器)
2. build app(构建app)
3. run -p  4000:80 app(运行app)

> Note: 
-p 端口映射80->4000
-d detached mode(background)
docker container stop *containerID*

## image(镜像)
> Note:
docker image ls 列出当前镜像

## swarm (集群)
1. swarm
> A swarm is a group of machines that are running Docker and joined into a cluster. After that has happened, you continue to run the Docker commands you’re used to, but now they are executed on a cluster by a swarm manager. The machines in a swarm can be physical or virtual. After joining a swarm, they are referred to as nodes.

2. swarm-Manager (集群管理)
> Swarm managers are the only machines in a swarm that can **execute your commands**, or **authorize other machines to join the swarm as workers**. Workers are just there to provide capacity and do not have the authority to tell any other machine what it can and cannot do.
## service(服务)

1. docker swarm init **初始化**
2. docker deploy -c ***app*.yaml** **app**

> Note:
```yaml
version: "3"
services:
  web:
    # replace username/repo:tag with your name and image details
    image: username/repo:tag
    deploy:
      replicas: 5
      resources:
        limits:
          cpus: "0.1"
          memory: 50M
      restart_policy:
        condition: on-failure
    ports:
      - "4000:80"
    networks:
      - webnet
networks:
  webnet:
```
## Share image
1. docker login **登录dockerHub**
2. docker tag userName/repository:tag **设置标签**
3. docker push username/repository:tag **发布**

> Note:
类似git:
login-> login
tag(标记) -> commit(保存快照)
push -> push
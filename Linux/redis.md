# redis

## 配置文件

1. daemonize 是否是守护进程
2. pidfile
3. port 6379
4. bind 允许的访问ip
5. logfile
6. database 10 数据库连接最大
7. save \[time] [update]
8. dbfilename 数据库文件
9. slaverof <masterip> <masterport>
10. masterauth <password>
11. requirepass <password>
12. maxclients 关闭新的链接,并返回max number of clients reached
13. 

## 常用命令

1. del key [key ...]
2. dump key
3. exist key
4. expire key seconds
5. ttl 有效时间
6. presist 永久有效
7. rename
8. move key db 移动到指定数据库
9. type 输出类型 

## String
1. set
2. setnx
3. incr key increament
4. decr key increament 
5. getset

## Hash
1. hset
2. hget
3. hmset
4. hmget
5. hgetall
6. hkey
7. hlen
8. hdel 删除hash中的字段

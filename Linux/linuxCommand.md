# 文件系统
＋ fsck options filesystem //文件系统检查

|选项|描述|
|---|---|
| -p                   |Automatic repair (no questions)
| -n                   |Make no changes to the filesystem
| -y                   |Assume "yes" to all questions
| -c                   |Check for bad blocks and add them to the badblock list
| -f                   |Force checking even if filesystem is marked clean
| -v                   |Be verbose
| -b superblock        |Use alternative superblock
| -B blocksize         |Force blocksize when looking for superblock
| -j external_journal  |Set location of the external journal
| -l bad_blocks_file   |Add to badblocks list
| -L bad_blocks_file   |Set badblocks list

# shell
## 子shell用法

+	ps -f //查看shell嵌套关系
	echo $BASH_SUBSHELL //返回0表示没有子shell
	& //会将进程置于后台(返回后台作业号,进程id)
	jobs //查看后台作业信息
+ 	协程
	coproc
## 基本shell脚本

+ 使用多个命令,使用分号隔开

+ 创建脚本文件第一行指定所用的shell //#!/bin/bash

+ 将命令的输出作为参数
	1. 反引号 test=`date`
	2. $()	test=$(date)
+ 数学运算(bash中仅支持整数运算)
	在bash中，在将一个数学运算结果赋给某个变量时，可以用美元符和方括号（$[operator]）将数学表达式围起来。


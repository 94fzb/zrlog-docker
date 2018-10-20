# ZrLog-Docker

> 方便一些不熟悉 Java 的能更快捷的搭建起 ZrLog

注：目前仅支持 Unix 系统，Windows 系统占不支持

## Docker 安装

### Debian/Ubuntu

`apt-get install docker.io`

### RedHat/CentOS

`yum install docker.io`

----

准备结束

fork 当前工程为一个私有仓库，或者直接 download zip

## 构建 ZrLog 容器

`sh build.sh` 如果后台提示有新版本可以通过这个命令构建最新 zrlog 容器 

## 安装

`sh install.sh`

安装完后需要将对应的数据库信息保存到 config/config.properties 里面，以保障使用 start.sh 可以正常读取到数据库信息

默认对外访问的端口是 `28080`，如果占用，改 install.sh 就可以了


```
# 数据库信息
db.password=123456
db.host=172.18.89.71
db.port=3306
db.username=zrlog_demo
db.database=zrlog_demo
# 容器里 tomcat 使用的端口
server.port=8080
# 容器对外公开的端口
export.port=28080
app.name=zrlog
```

## 运行

`sh start.sh`

## 升级

`sh upgrade.sh`

## 停止

`sh stop.sh`

## 其他

- Docker 本身无状态，所以有上传的图片的需求，需要使用云存储，目前 ZrLog 已支持了 `七牛云`和`腾讯云`
- 后台提供的文件编辑功能也是会因为 Docker 容器重启而丢失
- config 目录下面的 preview.properties 不需要配置
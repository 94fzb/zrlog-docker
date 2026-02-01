#/bin/sh
configFile='config/base-config.properties'
timezone='Asia/Chongqing'

prop() {
    grep "${1}" "${configFile}"|awk -F ${1}'=' '{print $2}'
}

docker run -d -p $(prop 'expose.port'):$(prop 'server.port') -e TZ=${timezone} \
 -e APP_NAME="$(prop 'app.name')" \
 -e EXPOSE_PORT="$(prop 'expose.port')" \
 -e DOCKER_MODE_START_BY='shell' \
 -e contextPath="$(prop 'contextPath')" \
$(prop 'app.name')

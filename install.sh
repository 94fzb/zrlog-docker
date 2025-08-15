#/bin/sh
configFile='config/base-config.properties'

prop() {
    grep "${1}" "${configFile}"|awk -F ${1}'=' '{print $2}'
}

docker run -d -p $(prop 'expose.port'):$(prop 'server.port') \
 -e APP_NAME="$(prop 'app.name')" \
 -e EXPOSE_PORT="$(prop 'expose.port')" \
 -e DOCKER_MODE='true' \
 -e contextPath="$(prop 'contextPath')" \
$(prop 'app.name')

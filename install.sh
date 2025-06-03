#/bin/sh
configFile='config/config.properties'

prop() {
    grep "${1}" "${configFile}"|awk -F ${1}'=' '{print $2}'
}

docker run -d -p $(prop 'export.port'):$(prop 'server.port') \
 -e DOCKER_MODE='true' \
$(prop 'app.name')

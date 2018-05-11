#/bin/sh
configFile='config/config.properties'

prop() {
    grep "${1}" ${configFile}|cut -d'=' -f2
}

docker run -d -p $(prop 'export.port'):$(prop 'server.port') \
 -e DOCKER_MODE='true' \
$(prop 'app.name')

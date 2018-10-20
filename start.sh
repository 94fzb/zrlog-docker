#/bin/sh
configFile='config/config.properties'
previewConfigFile='config/preview.properties'
timezone='Asia/Chongqing'

if [ -f ${configFile} ]; 
then
echo 'run docker ...'
else
echo 'Not found configFile: '${configFile}
exit 0
fi

prop() {
    grep "${1}" ${configFile}|cut -d'=' -f2
}
previewProp() {
    grep "${1}" ${previewConfigFile}|cut -d'=' -f2
}

# start docker
docker run -d -p $(prop 'export.port'):$(prop 'server.port') -e TZ=${timezone} -e PREVIEW_MODE="$(previewProp 'preview')" \
 -e DOCKER_MODE='true' \
 -e DEFAULT_USERNAME="$(previewProp 'default.username')" \
 -e DEFAULT_PASSWORD="$(previewProp 'default.password')" \
 -e DB_PROPERTIES='password='$(prop 'db.password')'
jdbcUrl=jdbc:mysql://'$(prop 'db.host')':'$(prop 'db.port')'/'$(prop 'db.database')'?&characterEncoding=UTF-8
user='$(prop 'db.username')'
driverClass=driverClass=com.mysql.cj.jdbc.Driver'  \
$(prop 'app.name')

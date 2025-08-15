#/bin/sh
baseConfigFile='config/base-config.properties'
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

dbProp() {
    grep "${1}" "${configFile}"|awk -F ${1}'=' '{print $2}'
}

prop() {
    grep "${1}" "${baseConfigFile}"|awk -F ${1}'=' '{print $2}'
}

previewProp() {
    grep "${1}" ${previewConfigFile}|cut -d'=' -f2
}

# start docker
docker run -d --restart=always  -m=384m -p $(prop 'expose.port'):$(prop 'server.port') -e TZ=${timezone} -e PREVIEW_MODE="$(previewProp 'preview')" \
 -e DOCKER_MODE='true' \
 -e contextPath="$(prop 'contextPath')" \
 -e DEFAULT_USERNAME="$(previewProp 'default.username')" \
 -e DEFAULT_PASSWORD="$(previewProp 'default.password')" \
 -e DB_PROPERTIES='jdbcUrl=jdbc:'$(dbProp 'db.type')'://'$(dbProp 'db.host')':'$(dbProp 'db.port')'/'$(dbProp 'db.database')'
user='$(dbProp 'db.username')'
password='$(dbProp 'db.password')'
driverClass=com.mysql.cj.jdbc.Driver'  \
$(prop 'append.args') \
$(prop 'app.name')

#/bin/sh
configFile='config/config.properties'

prop() {
    grep "${1}" "${configFile}"|awk -F ${1}'=' '{print $2}'
}
docker buildx build --build-arg DUMMY=`date +%s`  . -t $(prop 'app.name')

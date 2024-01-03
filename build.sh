#/bin/sh
configFile='config/config.properties'

prop() {
    grep "${1}" ${configFile}|cut -d'=' -f2
}
docker buildx build --build-arg DUMMY=`date +%s`  . -t $(prop 'app.name')

configFile='config/base-config.properties'

prop() {
    grep "${1}" "${configFile}"|awk -F ${1}'=' '{print $2}'
}
docker rmi --force $(docker images -q $(prop 'app.name') | uniq)
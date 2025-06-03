configFile='config/config.properties'

prop() {
    grep "${1}" "${configFile}"|awk -F ${1}'=' '{print $2}'
}
docker stop $(docker ps -q --filter ancestor=$(prop 'app.name'))
configFile='config/base-config.properties'

prop() {
    grep "${1}" "${configFile}"|awk -F ${1}'=' '{print $2}'
}
docker exec -it $(docker ps -q --filter ancestor=$(prop 'app.name')) /bin/bash
configFile='config/config.properties'

prop() {
    grep "${1}" ${configFile}|cut -d'=' -f2
}
docker exec -it $(docker ps -q --filter ancestor=$(prop 'app.name')) /bin/bash
configFile='config/config.properties'

prop() {
    grep "${1}" ${configFile}|cut -d'=' -f2
}
docker stop $(docker ps -q --filter ancestor=$(prop 'app.name'))
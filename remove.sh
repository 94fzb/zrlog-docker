configFile='config/config.properties'

prop() {
    grep "${1}" ${configFile}|cut -d'=' -f2
}
docker rmi --force $(docker images -q $(prop 'app.name') | uniq)
rm_container(){
  container_name=${1:-"container_name"}
  for i in $(docker ps -a | grep "$container_name" | awk '{print $1}')
  do
    echo "deleting $i ..."
    docker rm -f $i
  done
}

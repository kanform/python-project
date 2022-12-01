source common/vars.sh
source common/set_tag.sh

container=${1:-"container_name"}
in_port=${2:-"80"}
target_port=${2:-"8080"}

create_container(){
docker run -d -p ${in_port}:${target_port} --name $container_name \
 ${docker_repo}/${docker_image_name}:${tag_version}
}

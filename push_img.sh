#!/bin/bash

source common/vars.sh
source common/set_tag.sh

docker push ${docker_repo}/${docker_image_name}:${tag_version}

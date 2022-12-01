#!/bin/bash

source common/vars.sh
source common/set_tag.sh

docker build -t ${docker_repo}/${docker_image_name}:${tag_version} .

nocss="v1.0"
green="v1.1"
indigo=${violet:-"v1.2"}
main=$indigo
current_branch=$(git rev-parse --abbrev-ref HEAD)
docker_repo="kanform"
docker_image_name="python-project"

isColor=${!current_branch}

if [ "${isColor}WWW" != "WWW" ]
then
  tag_version=${isColor}
else
  tag_version=${current_branch}
fi

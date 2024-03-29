#!/bin/bash
# This is an Sample project to build BaseImage needed for CICD 
# JAVA Web Application used for vijay CICD 


# Setup logging
log()
{
     echo -e "[`date '+%Y-%m-%d %T'`]:" $1
}

build_image()
{
    log "INFO: Starting docker build of $1"

    /usr/bin/docker build --build-arg BASE_IMAGE_NAME=${BaseImage} -t ${BuildImage} . --no-cache --force-rm
    if [ $? -ne "0" ]; then
      log "ERROR: Docker build failed"
      exit
    fi
}

push_image()
{
    log "INFO: Login to the docker registry"
        /usr/bin/docker login -u vijay2181 -p 

        if [ $? -ne "0" ]; then
        log "ERROR: Docker registry login failed"
        exit 1
    else
        log "INFO: Docker registry login [[ success ]]  "
    fi

        log "INFO: Starting to push image to the repository"
    /usr/bin/docker tag ${Build_Img} vijay2181/${Build_Img}
    /usr/bin/docker push vijay2181/${Build_Img}

    if [ $? -ne "0" ]; then
        log "ERROR: Docker Push command failed"
        exit 1
    else
        log "INFO: Docker Push to registry Succeeded"
    fi

}

# main #
if [ "$#" -eq 3 ]; then
  BASE_IMAGE=$1
  Build_Img=$2
  paswd=$3
else
  BASE_IMAGE="jboss/base-jdk:11"
  Build_Img="wildfly"
fi

build_image
push_image

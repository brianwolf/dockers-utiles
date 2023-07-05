 
docker run -it --privileged --rm -v $(pwd):/docker buildah/buildah sh

buildah build-using-dockerfile -f /docker/Dockerfile .

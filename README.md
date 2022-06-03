# alpine-kubectl 

*alpine image with kubectl and bash completion enabled*

<br>

```console
docker run --rm -it -v ${HOME}:/root/ ${pwd}:/work -w /work smuse/alpine-kubectl:v1.24.1
```

## Build 

```console
kubectl_version=v.1.24.1
docker build . --build-arg kubectl_version=$kubectl_version -t smuse/alpine-kubectl:$kubectl_version 
```
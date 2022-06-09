# alpine-kubectl 

*alpine image with kubectl, bash completion enabled, and vim for yaml configured*

<br>

```console
docker run --rm -it -v ~/.kube:/.kube -v ${PWD}:/work \ 
-w /work smuse/alpine-kubectl:v1.24.1
```

## Build 

```console
kubectl_version=v1.24.1
docker build . --build-arg kubectl_version=$kubectl_version -t smuse/alpine-kubectl:$kubectl_version 
```
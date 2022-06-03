FROM alpine:3.16.0

RUN apk add --no-cache curl nano bash-completion

ARG kubectl_version

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/$kubectl_version/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl

RUN chmod u+x /usr/local/bin/kubectl

# Enable bash-completion and add alias 
RUN echo  -e \
"alias k=kubectl \n \
complete -F __start_kubectl k  \n \
$(kubectl completion bash ) " \
>> ~/.bashrc 

# Configure default editor to nano
ENV KUBE_EDITOR="nano"

ENTRYPOINT bash
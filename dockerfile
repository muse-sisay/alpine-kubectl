FROM alpine:3.16.0

RUN apk add --no-cache curl vim bash-completion

ARG kubectl_version

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/$kubectl_version/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl

RUN chmod u+x /usr/local/bin/kubectl

# Enable bash-completion, add alias and shell prompt
RUN echo  -e \
"PS1=\"\[\033[32m\] \W\[\033[37m\] \$ \" \n \
alias k=kubectl \n \
export do=\"-o=yaml --dry-run=client\" \n \
complete -F __start_kubectl k  \n \
$(kubectl completion bash ) " \
>> ~/.bashrc 

# Configure vim for YAML files
RUN  echo -e \
"colorscheme ron \n \
set tabstop=2 \n \
set shiftwidth=2 \n \
set expandtab \n \
set autoindent \
" >> ~/.vimrc

# Configure default editor to nano
ENV KUBE_EDITOR="vim"

ENTRYPOINT bash
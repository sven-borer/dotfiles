alias ls='ls --color=auto'
alias ll='ls -la'
alias ipb='ip --brief'

function clean_docker () {
    [[ $(docker container ls -a | tail -n +2) ]] && docker container ls -a | tail -n +2 | awk '{ print $1}' | xargs docker stop
    [[ $(docker container ls -a | tail -n +2) ]] && docker container ls -a | tail -n +2 | awk '{ print $1}' | xargs docker rm
    # [[ $(docker images | tail -n +2) ]] && docker images | tail -n +2 | awk '{ print $1 }' | xargs docker rmi
    [[ $(docker volume ls | tail -n +2) ]] && docker volume ls | tail -n +2 | awk '{ print $2 }' | xargs docker volume rm
}

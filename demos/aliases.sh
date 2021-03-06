#!/bin/bash
alias cdd="cd ${PWD}"

# Generate args to highlight changed lines for bat
BAT_LANG=""
batdf() { hArgs=$(diff --unchanged-line-format="" --old-line-format="" --new-line-format="%dn " ${1} ${2} | xargs -n1 -I {} printf -- '-H %s:%s ' {} {}); bat ${BAT_LANG} ${2} $hArgs; }
alias batd=batdf
setBatLangf() { if [[ "${1}" == "" ]]; then export BAT_LANG=""; else export BAT_LANG="-l ${1}"; fi; alias bat="bat ${BAT_LANG}"; }
alias setBatLang=setBatLangf
setBatLang ""
# Usage example:
# setBatLang Dockerfile
# bat Dockerfile
# batd Dockerfile Dockerfile2
# setBatLang exclude
# bat .dockerignore
# batd .dockerignore .dockerignore2
# To use default language detection, set to empty string:
# setBatLang

# brew install colordiff
# catd - like diff, but side-by-side and colored
catdf() { colordiff -yW"`tput cols`" ${1} ${2}; }
alias catd=catdf
alias yqc="yq r -C"
alias tree="tree -C"
alias cicd1="source demorunner.sh \$ADMIN/demos/1-pack/demo.txt"
alias cicd2="source demorunner.sh \$ADMIN/demos/2-kustomize/demo.txt"
alias cicd3="source demorunner.sh \$ADMIN/demos/3-argocd/demo.txt"
alias cicd4="source demorunner.sh \$ADMIN/demos/4-kpack/demo.txt"
alias cicd5="source demorunner.sh \$ADMIN/demos/5-workflow-automation/demo.txt"
alias cicd6="source demorunner.sh \$ADMIN/demos/6-automatic-deployment/demo.txt"
alias cicd7="source demorunner.sh \$ADMIN/demos/7-final-workflow/demo.txt"
alias cicd8="source demorunner.sh \$ADMIN/demos/8-jenkinsx/demo.txt"

alias dclean='docker ps -a -q | xargs -n1 docker stop; docker system prune -af'

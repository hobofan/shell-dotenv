#! /bin/zsh

function dotenv () {
  regex="DOT_ENV\=(\w+)"
  if [[ $1 =~ $regex ]]; then
    env="${match[1]}"
    file_name=".env.${env}"
    if [[ -f $file_name ]]; then
      source_env $file_name
      return
    fi
  fi

  file_name=".env"
  source_env $file_name
}

function source_env() {
  source_specific_env ".env.clean"
  source_specific_env $1
}

function source_specific_env() {
  if [[ -f $1 ]]; then
    source $1
    export $(cut -d= -f1 ${1})
  fi
}

autoload -Uz  add-zsh-hook

add-zsh-hook preexec dotenv

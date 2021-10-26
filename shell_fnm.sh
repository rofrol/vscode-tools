#!/bin/bash

# there is way to mention runtime version in launch.json. But no such thing to specify in tasks.json and auto detected tasks.
# This is by design. The npm task type relies on being able to just run npm <script> https://github.com/microsoft/vscode/issues/102746#issuecomment-659940381
# https://gist.github.com/fvclaus/540c08921ba884fef959053c4f974bfc

set -e

if [[ "$2" == npm* ]] || [[ "$2" == yarn* ]] || [[ "$2" == gulp* ]]; then
  # https://stackoverflow.com/questions/9376904/find-file-by-name-up-the-directory-tree-using-bash/9377073#9377073
  # https://superuser.com/questions/455723/is-there-an-upwards-find
  DIR=$(pwd)
  while [ "$DIR" != "/" ] ; do
      DIR=$(dirname "$DIR")
      # https://stackoverflow.com/questions/27425852/what-uses-respects-the-node-version-file
      # https://stackoverflow.com/questions/22624905/find-command-with-regex-for-multiple-file-extension/  23375146#23375146
      [ $(find "$DIR" -maxdepth 1 -name .nvmrc -or -name .node-version) ] && break
  done
  
  if [ -f "$DIR/.nvmrc" ] || [ -f "$DIR/.node-version" ]; then
      cd "$DIR"
      fnm use --log-level quiet
      cd -
  fi
fi

node -v

# there is `-c` passed from vscode
/bin/bash "$@"

#!/bin/bash

USER_ID=${LOCAL_UID:-9001}
GROUP_ID=${LOCAL_GID:-9001}

echo "Starting with UID : $USER_ID, GID: $GROUP_ID"
echo "Execution user: username"
useradd -u $USER_ID -o -m username
groupmod -g $GROUP_ID username
export HOME=/home/username

exec /usr/sbin/gosu username "$@"

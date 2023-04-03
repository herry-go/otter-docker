#!/bin/bash

cmd=$1

if [ ! -d ${OTTER_HOME}/logs/node ] ; then
	mkdir -p ${OTTER_HOME}/logs/node
fi

case $cmd in
"start" | "restart")
  bash "/otter-node/bin/${cmd}.sh" &&
    sleep 5s && tail -F /otter-node/logs/node/node.log
  ;;
"stop")
  bash "/otter-node/bin/${cmd}.sh"
  ;;
*)
  exec "$@"
  ;;
esac




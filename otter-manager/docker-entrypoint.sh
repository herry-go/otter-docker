#!/bin/bash

cmd=$1

if [ ! -d ${OTTER_HOME}/logs ]; then
	mkdir -p ${OTTER_HOME}/logs
fi


case $cmd in
"start" | "restart")
  cd ${OTTER_HOME}/logs
  bash "/otter-manager/bin/${cmd}.sh" &&
    sleep 5s && tail -F /otter-manager/logs/manager.log
  ;;
"stop")
  bash "/otter-managerr/bin/${cmd}.sh"
  ;;
*)
  exec "$@"
  ;;
esac




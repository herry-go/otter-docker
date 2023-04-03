#!/bin/bash

current_path=`pwd`
base=${OTTER_HOME}
otter_conf=${base}/conf/otter.properties
logback_configurationFile=${base}/conf/logback.xml

export LANG=en_US.UTF-8
export BASE=${base}


JAVA_OPTS="-server -Xms${Xms} -Xmx${Xmx} -Xmn${Xmn} -XX:SurvivorRatio=2 -XX:PermSize=${PermSize} -XX:MaxPermSize=${MaxPermSize} -Xss256k \
-XX:-UseAdaptiveSizePolicy -XX:MaxTenuringThreshold=15 -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC \
-XX:+CMSParallelRemarkEnabled -XX:+UseCMSCompactAtFullCollection -XX:+UseFastAccessorMethods \
-XX:+UseCMSInitiatingOccupancyOnly -XX:+HeapDumpOnOutOfMemoryError"

JAVA_OPTS=" $JAVA_OPTS -Djava.awt.headless=true -Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8"
OTTER_OPTS="-DappName=${appName} -Ddubbo.application.logger=slf4j -Dlogback.configurationFile=$logback_configurationFile -Dotter.conf=$otter_conf"

if [ -e $otter_conf -a -e $logback_configurationFile ]
then

	for i in ${base}/lib/*;
		do CLASSPATH=${i}:"$CLASSPATH";
	done
 	CLASSPATH="$base:$base/conf:$CLASSPATH";
	echo LOG CONFIGURATION : ${logback_configurationFile}
	echo otter conf : ${otter_conf}
	echo CLASSPATH :${CLASSPATH}
	java $JAVA_OPTS $JAVA_DEBUG_OPT $OTTER_OPTS -classpath .:$CLASSPATH com.alibaba.otter.manager.deployer.OtterManagerLauncher 1>>$base/logs/manager.log 2>&1 &
	echo $! > $base/bin/otter.pid
	echo "cd to $current_path for continue"
	cd $current_path
else
	echo "otter conf("${otter_conf}") OR log configration file($logback_configurationFile) is not exist,please create then first!"
fi
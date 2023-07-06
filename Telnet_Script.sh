#!/bin/bash

remote_host=10.66.1.12  #Удалённый хост
remote_port=22  #Проверяемый хост

check_port() {
    result=$(echo "quit" | telnet "$remote_host" "$remote_port" 2>&1)
    if [[ "$result" == *"Connected"* ]]; then
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Port $remote_port is open on $remote_host" >> //script/nms/zabbix/telnetlog.txt
    else
        echo "[$(date '+%Y-%m-%d %H:%M:%S')] Port $remote_port is closed on $remote_host" >> //script/nms/zabbix/telnetlog.txt
    fi
}
check_port

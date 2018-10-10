# Usage

1. 启动 grafana & prometheus & pushgateway

        make start

2. crontab里加入定时脚本

        * * * * * bash /home/oylbin/website-speed-monitor/cron.sh

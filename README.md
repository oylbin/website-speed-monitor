# Usage

1. clone code and then

        make start

    Makefile will do following things:

    1. use docker to start grafana & prometheus & pushgateway
    1. provisioning grafana ( add datasource & dashboard )
    1. add cron.sh to crontab

1. open [http://localhost:23000/d/website-monitor](http://localhost:23000/d/website-monitor)


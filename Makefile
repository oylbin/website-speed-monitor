# https://stackoverflow.com/questions/18136918/how-to-get-current-relative-directory-of-your-makefile
mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))

start:
	docker-compose up -d grafana prometheus pushgateway
	bash install_cron.sh

clean:
	-docker rm --force website-monitor-grafana
	-docker rm --force website-monitor-prometheus
	-docker rm --force website-monitor-pushgateway
	rm -rf data/*

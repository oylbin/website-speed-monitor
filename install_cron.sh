export SCRIPTDIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cron_script=$SCRIPTDIR/cron.sh

crontab -l > /tmp/crontab
grep "$cron_script" /tmp/crontab 
if [[ "$?" != "0" ]]; then
    echo "install crontab"
    echo -e "\n* * * * * bash $cron_script > /dev/null 2>&1" >> /tmp/crontab
    crontab /tmp/crontab
else
    echo "crontab already installed"
fi

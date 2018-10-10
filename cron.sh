export SCRIPTDIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "START" && date

echo > /tmp/speed

for metric in time_namelookup time_connect time_appconnect time_pretransfer time_redirect time_starttransfer time_total
do
    echo "# TYPE $metric gauge" >> /tmp/speed
done

bash $SCRIPTDIR/website-speed.sh "https://www.google.com" >> /tmp/speed
bash $SCRIPTDIR/website-speed.sh "https://www.facebook.com" >> /tmp/speed
bash $SCRIPTDIR/website-speed.sh "https://hub.docker.com/u/prom/" >> /tmp/speed

curl --data-binary "@/tmp/speed" http://127.0.0.1:29091/metrics/job/website-speed
echo "END" && date

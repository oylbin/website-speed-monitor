url=$1

# url 里不能有空格、单引号、双引号
curl --max-time 15 -s -w 'time_namelookup{url="'$url'"}\t%{time_namelookup}\ntime_connect{url="'$url'"}\t%{time_connect}\ntime_appconnect{url="'$url'"}\t%{time_appconnect}\ntime_pretransfer{url="'$url'"}\t%{time_pretransfer}\ntime_redirect{url="'$url'"}\t%{time_redirect}\ntime_starttransfer{url="'$url'"}\t%{time_starttransfer}\ntime_total{url="'$url'"}\t%{time_total}\n' -o /dev/null "$url"

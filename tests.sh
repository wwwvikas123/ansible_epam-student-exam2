STATUSCODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" http://192.168.0.102:10002)

if [ "$STATUSCODE" -ne 200 ]; then exit 1; fi
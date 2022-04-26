STATUSCODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" http://localhost:10002)

if [ "$STATUSCODE" -ne 200 ]; then exit "$STATUSCODE"; fi
STATUSCODE=$(curl --silent --output /dev/stderr --write-out "%{http_code}" URL)

if [ "$STATUSCODE" -ne 200 ]; then exit "$STATUSCODE"; fi
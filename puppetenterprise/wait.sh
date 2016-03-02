/bin/bash

while ! nc -q 1 localhost 8140 </dev/null; do sleep 30; done

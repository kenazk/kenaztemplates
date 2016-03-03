#!/bin/bash

while ! nc -q 1 localhost 443 </dev/null; do sleep 30; done

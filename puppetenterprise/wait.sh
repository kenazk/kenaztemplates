#!/bin/bash

while ! curl -k https://localhost:8140/status/v1/services | jq '.["pe-master"].state == "running"'; do sleep 30;  done

#!/bin/bash

azure config mode arm
azure group create $1 westus
azure group deployment create -f ~/git/kenaztemplates/puppetenterprise/azuredeploy.json -e ~/git/kenaztemplates/puppetenterprise/azuredeploy.parameters.json $1 $1

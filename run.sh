#!/usr/bin/env bash

export PACKER_LOG=1

packer build mgmt_jenkins.json

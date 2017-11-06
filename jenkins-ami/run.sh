#!/usr/bin/env bash

export PACKER_LOG=1

packer build create_jenkins.json

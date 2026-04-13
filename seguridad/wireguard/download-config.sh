#!/usr/bin/env bash

set -ex

docker cp wireguard:config/peer$1 peer$1
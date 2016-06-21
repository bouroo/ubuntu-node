#!/usr/bin/env bash

cd /app && node start &

tail -f /dev/null

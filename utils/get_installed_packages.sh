#!/bin/bash

grep "apt.* install" /var/log/apt/history.log | grep -v broken | grep -Po 'install\s\K.*' | sort -u

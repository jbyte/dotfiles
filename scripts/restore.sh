#!/usr/bin/env bash
rsync -aAXv --exclude-from='/home/jbyte/.exclude.rsync' --delete /oth/backup/* /

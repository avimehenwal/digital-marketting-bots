#!/usr/bin/fish

# AUTHOR      : avimehenwal
# DATE        : 12-Jan-2020
# PURPOSE     : entrypoint bots framework
#
# Capture startup options and change to
# change default configurations

kill -9 (pgrep firefox)
kill -9 (pgrep chrome)

clear
robot \
    --dryrun \
    --rpa \
    --name 'My Bots' \
    --outputdir ./bots/output \
    --exclude skip \
    ./


# END

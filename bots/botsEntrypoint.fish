#!/usr/bin/fish

# AUTHOR      : avimehenwal
# DATE        : 15-April-2020
# PURPOSE     : bot framework entrypoint
#
# This script runs the Avi Digital Marketting Bots


set iter 5
echo $iter

if pgrep chrome
    kill -9 (pgrep chrome)
end
if pgrep firefox
    kill -9 (pgrep firefox)
end

robot \
    --dryrun \
    # --include test-structure \
    --exclude 'self-test'  \
    --include twitter \
    --rpa \
    --name "My Bots" \
    # --suite BlessLikes \
    --outputdir output \
    --debugfile debugfile.log \
    --loglevel DEBUG \
    --reportbackground "#ADD8E6":"#FFCCCB" \
    --suitestatlevel 3 \
    --variablefile ../vars.yaml \
    # --variable iter:$iter \
    ./

# instagram-bot/instagram.robot

# END

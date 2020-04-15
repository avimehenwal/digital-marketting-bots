#!/usr/bin/fish

set iter 5
echo $iter

if pgrep chrome
    kill -9 (pgrep chrome)
end

robot \
    --dryrun \
    # --include test-structure \
    # --exclude homepage \
    --rpa \
    --name "Avi Instagram Bot" \
    # --suite BlessLikes \
    --outputdir output \
    --debugfile debugfile.log \
    --loglevel DEBUG \
    --reportbackground "#ADD8E6":"#FFCCCB" \
    --suitestatlevel 3 \
    --variablefile ../vars.yaml \
    --variable iter:$iter \
    tests

# instagram-bot/instagram.robot

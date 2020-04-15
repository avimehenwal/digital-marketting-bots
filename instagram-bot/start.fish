#!/usr/bin/fish

set iter 5
echo $iter

if pgrep chrome
    kill -9 (pgrep chrome)
end

robot \
    --rpa \
    --dryrun \
    --outputdir output \
    # --name InstagramOutreach \
    # --suite BlessLikes \
    --debugfile debugfile.log \
    --loglevel DEBUG \
    # --reportbackground green:red \
    --suitestatlevel 3 \
    --variablefile ../vars.yaml \
    --variable iter:$iter \
    tests

# instagram-bot/instagram.robot

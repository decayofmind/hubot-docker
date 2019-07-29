# hubot-docker
Minimalistic Docker image with Hubot. 

Easy to use if you have a lot of custom scripts and external scripts, but don't want to bake them into image.


# Environment variables

* `HUBOT_NAME` - name of the Hubot. Not that necessary, defaults to `robot`.
* `EXTRA_PACKAGES` - comma-separated list of NPM packages, required by your scripts.

# Container creation

Following arguments are getting passed to hubot command by default: `--name $HUBOT_NAME --adapter slack`. If you want to add something extra - rewrite those arguments in command, during a container creation (Eg.: `--name $HUBOT_NAME --adapter slack --alias "\!"`).

If you want to use custom scripts, it's worth to mount it as a volume (`-v <your_path_to_scripts>:/home/hubot/scripts`). Also, add scripts dependecies to `EXTRA_PACKAGES` variable (Eg.: `-e EXTRA_PACKAGES=aws-sdk,cron`). The entrypoint will install at start-up.

If you want some external scripts to be used and enabled, mount `external-scripts.json` as a volume (`-v <your_path_to_external-scripts.json>:/home/hubot/external-scripts.json`).

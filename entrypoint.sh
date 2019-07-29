#!/bin/sh

if [ -n "$EXTRA_PACKAGES" ]; then
  echo "Installing extra packages..."
  npm install --save  $(echo "$EXTRA_PACKAGES" | tr ',' ' ')
fi

echo "Installing packages from external-scripts.json ..."
npm install --save  $(tr -d '",[]' < ./external-scripts.json)


HUBOT_VERSION=$(grep "hubot\":" ./package.json | awk -F " " '{print $2}' | tr -d ',^"')

echo "Starting $HUBOT_NAME (Hubot $HUBOT_VERSION) ..."

bin/hubot "$@"

#!/bin/bash

# Entry point documentation:
# https://success.docker.com/article/use-a-script-to-initialize-stateful-container-data

# Exit script if any command return non zero
set -e

# Print some information
# ======================
printf "\n.Net Core runtime:\n`dotnet --list-runtimes`\n\n"

# Check if only waiting is asked (for debug in k8s)
# =================================================
if [ "$1" = 'wait-infinite' ]; then
	echo "Infinite wait (debug): keeping the container running..."
	while true; do echo "Waiting 10s..."; sleep 10; done
fi

# "$@" = all parameters, ie default CMD or manual parameters specified
echo "Executing a non default command [$@]"
exec "$@"

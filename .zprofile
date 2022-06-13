export DOTNET_ROOT=/snap/dotnet-sdk/current
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export PROGRAMMING_ROOT=~/Desktop/Programming
if [ "$(tty)" = "/dev/tty1" ]; then
	exec sway
fi

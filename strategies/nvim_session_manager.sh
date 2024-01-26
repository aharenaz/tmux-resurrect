#!/usr/bin/env bash

# "nvim session manager strategy"
#

ORIGINAL_COMMAND="$1"
DIRECTORY="$2"

original_command_contains_session_flag() {
	[[ "$ORIGINAL_COMMAND" =~ "-S" ]]
}

main() {
	if original_command_contains_session_flag; then
		# Session file does not exist, yet the original nvim command contains
		# session flag `-S`. This will cause an error, so we're falling back to
		# starting plain nvim.
		echo "nvim"
	else
		echo "$ORIGINAL_COMMAND +'lua require(\"session_manager\").load_current_dir_session();'"
	fi
}
main

# Export the name of the user as a variable
havecmd git && export GITUSER="$(git config --global user.name)"

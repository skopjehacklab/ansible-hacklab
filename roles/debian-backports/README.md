# Debian Backports

This role enables the backports repo (for the current debian release).

Options:
 - `packages` - a list of packages to install from the backports repo
 - `pin_backports` - default is 100, setting it above 500 will make backports packages to install over the release packages

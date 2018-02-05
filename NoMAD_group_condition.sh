#!/bin/bash
# Author: Mike Solin

# This condition_script supplies: 
# nomad_groups (array): a list of AD groups the current user is a member of.

# To have awesome_package install only when this user is a member of 
# the 'awesome_users' AD group use the following condition:
#
# (case and diacritic insensitive)
# <key>conditional_items</key>
# 	<array>
# 		<dict>
# 			<key>condition</key>
# 			<string>ANY nomad_groups CONTAINS "awesome_users"</string>
# 			<key>managed_installs</key>
# 			<array>
# 				<string>awesome_package</string>
# 			</array>
# 		</dict>
# 	</array>

defaults="/usr/bin/defaults"
plutil="/usr/bin/plutil"

# determine the primary user of the computer
last_user=$(${defaults} read /Library/Preferences/com.apple.loginwindow.plist lastUserName 2>/dev/null)

# if user hasn't logged into NoMAD, bail
last_nomad_user=$(${defaults} read /Users/${last_user}/Library/Preferences/com.trusourcelabs.NoMAD.plist LastUser)
if [ ! "$last_nomad_user" ]; then 
	exit 0
fi

# determine where to write the conditionals
managedinstalldir="$(${defaults} read /Library/Preferences/ManagedInstalls ManagedInstallDir)"
plist_loc="${managedinstalldir}/ConditionalItems"

# determine NoMAD groups
# already an array, so nothing fancy required
nomad_groups=$(${defaults} read /Users/${last_user}/Library/Preferences/com.trusourcelabs.NoMAD.plist Groups)

# write NoMAD groups to a plist
${defaults} write "$plist_loc" "nomad_groups" -array "${nomad_groups[@]}"

# convert the plist from binary to xml
${plutil} -convert xml1 "$plist_loc".plist

exit 0

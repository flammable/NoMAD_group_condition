#!/bin/bash
# Author: Mike Solin

# This condition_script supplies: 
# nomad_groups (array): a list of AD groups the current user is a member of.

# To have awesome_package install only when this user is a member of 
# the 'awesome_users' AD group use the following condition:
#
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

# determine where to write the conditionals
managedinstalldir="$(${defaults} read /Library/Preferences/ManagedInstalls ManagedInstallDir)"
plist_loc="${managedinstalldir}/ConditionalItems"

# determine NoMAD groups
nomad_groups=$(${defaults} read /Users/${last_user}/Library/Preferences/com.trusourcelabs.NoMAD.plist Groups)

# if user has no NoMAD groups, bail
if [ ! "${nomad_groups}" ]; then 
	exit 0
fi

# write NoMAD groups to a plist
${defaults} write "$plist_loc" "nomad_groups" "${nomad_groups[@]}"

# convert the plist from binary to xml
${plutil} -convert xml1 "${plist_loc}".plist

exit 0

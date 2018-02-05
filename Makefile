USE_PKGBUILD=1
include /usr/local/share/luggage/luggage.make
TITLE=NoMAD_group_condition
REVERSE_DOMAIN=edu.sju
PACKAGE_VERSION=1.0
PAYLOAD=\
	pack-usr-local-munki-conditions-NoMAD_group_condition.sh

munkiimport: pkg
		munkiimport \
--nointeractive \
--subdirectory scripts \
--name "${TITLE}" \
--displayname "NoMAD Group Condition" \
--description "Determines NoMAD groups for software deployment." \
--category "Scripts" \
--developer "Saint Joseph's University" \
--icon_name "NoMAD.png" \
--minimum_os_version "10.5.0" \
--unattended_install \
--unattended_uninstall \
--update_for "NoMAD" \
"${PACKAGE_FILE}"
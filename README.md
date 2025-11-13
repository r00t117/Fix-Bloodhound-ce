# Fix-Bloodhound-ce

BloodHound CE can fail to reset the admin password after reinstalling, even if you uninstall it through the CLI. The issue is caused by leftover Docker volumes, networks, and local config files that are not removed, which keeps old data alive and breaks the login process.

This script performs a full cleanup of all BloodHound containers, volumes, networks, and local config directories so the next bloodhound-cli install starts completely fresh.

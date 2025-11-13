# Fix-Bloodhound-ce

I originally thought BloodHound CE was failing to reset the admin password after reinstalling, but the issue ended up being browser-related. Firefox was holding onto old cached data, which caused the login and password-reset process to break. Using another browser (or clearing the Firefox cache) immediately fixed it.

Since I spent time troubleshooting before realizing this, I created a script that fully removes all BloodHound CE containers, volumes, networks, and local config files. It isn’t required for the browser issue, but it’s useful if BloodHound ever gets stuck with leftover Docker data.

Run it with:

'sudo ./nuke-bloodhound.sh'

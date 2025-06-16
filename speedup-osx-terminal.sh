# clear out terminal private log file
echo "Clearing out private logs"
sudo rm -rf /private/var/log/asl/*.asl

# hush logins as advised on stackexchange
# URL:
# http://apple.stackexchange.com/questions/41743/how-do-i-speed-up-new-terminal-tab-loading-time
echo "Hushing logins"
touch ~/.hushlogin

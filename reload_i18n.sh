#!/bin/bash
# A simple script to reload translations from github

cd /tmp
git clone https://github.com/tanuch/discourse-th.git
cp -rT discourse-th/ /var/discourse/
cp -f discourse-th/reload_i18n.sh /root/reload_i18n.sh
chmod +x /root/reload_i18n.sh
rm -rf discourse-th
cd /var/discourse
sudo -u discourse RAILS_ENV=production bundle exec rake assets:clobber assets:precompile

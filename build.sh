#!/bin/bash -i
set -euo pipefail
rpm --quiet -qi jq 2> /dev/null || yum install -y jq
VERSION="7.12.0"
rbenv exec gem install --no-rdoc --no-ri fpm
rbenv exec fpm -t rpm -a noarch --rpm-use-file-permissions -s dir -m '<build@apisnetworks.com>' --epoch 7 --iteration 1.apnscp."$(date '+%Y%m%d')" -v $VERSION --license 'GNU General Public License, version 2' -n phppgadmin -s dir -t rpm -x "*/config.inc.php*" -x "/var/www/html/phpPgAdmin/.git" ./var/www/html/phpPgAdmin

sudo su

# timezone
cp -p /usr/share/zoneinfo/Japan /etc/localtime

# tools
yum -y update
yum -y install yum-plugin-priorities
yum -y groupinstall "Base" "Development tools" "Japanese Support"

# # firewalld 停止
# systemctl stop firewalld
#
# # firewalld 自動起動停止
# systemctl disable firewalld

# apache インストール
yum -y install httpd

# apache 起動
systemctl start httpd.service

# apache 自動起動設定
systemctl enable httpd.service

# # MySql インストール
# yum -y install http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
# yum -y install mysql-community-server
#
# # MySQL 起動
# systemctl start mysqld.service
#
# # MySQL 自動起動設定
# systemctl enable mysqld.service

# EPEL リポジトリ追加
yum -y install epel-release

# Remi リポジトリ追加
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

# RPMforge リポジトリ追加
yum -y install http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm

# PHP インストール
yum --enablerepo=remi-php70 -y install php php-mbstring php-pear php-fpm php-pdo php-intl

# phpMyAdmin インストール
yum --enablerepo=remi-php70 -y install phpMyAdmin php-mcrypt

# apache 再起動
systemctl restart httpd.service

# DocumentRoot設定
rm -rf /var/www/html
ln -fs /vagrant/html /var/www/html

# http://qiita.com/wakisuke/items/f0483783a0652ac8c1c5
# setsebool -P httpd_enable_homedirs on
# setsebool -P httpd_read_user_content on
sudo setenforce 0

# test file. Do not overwrite it.
if [[ ! -f /var/www/html/index.php ]]; then
  echo "<?php phpinfo(); ?>" >> /var/www/html/index.php
fi


# README #

## インストールされるもの

(2016.03.07時点)

* CentOS 7.0
* Apache 2.4.6
* PHP 7.0.4
* MySql 5.6.29


## 使い方

### vagrant box を追加する
（バージョンを変更する場合は、Vagrantファイルの中身も書き換える）
```
vagrant box add centos7 https://github.com/tommy-muehle/puppet-vagrant-boxes/releases/download/1.1.0/centos-7.0-x86_64.box
```

### 本リポジトリをcloneする
```
git clone https://github.com/ayayan-z/vagrantfile.git
```

### vagrant を起動する
```
cd vagrantfile
vagrant up
```

### 確認
http://192.168.33.10/

phpinfo画面が出たらOK


### vagrant コマンド
```
# 起動
vagrant up

# 停止
vagrant halt

# 再起動
vagrant reload

# provisioning実行
vagrant provision
```
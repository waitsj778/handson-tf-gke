### 0-1. Homebrew on Linuxをインストールする
```
$/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
### 0-2. tfenvをインストールする
```
$ brew install tfenv
```
### 1. tfenvを用いてTerraformをインストールする
```
$tfenv install 0.14.10
```
### 2. tfenvを用いてTerraformのバージョンを固定する
```
$tfenv use 0.14.10
```
### 3. tfstateを管理するためのGCSを作成する
#### 3.1. Google Cloud SDKを有効化する
```
$gcloud auth login
$gcloud auth application-default login
```
#### 3.2. projectを設定する
```
$gcloud config set project [YOUR PROJECT ID]
```
#### 3.3. GCSを作成する
```
$gsutil mb -b on -l asia-northeast1 gs://[YOUR PROJECT ID]-terraform-backend
```
### 4. デプロイする
```
$terraform init
$terraform workspace new dev
$terraform plan
$terraform apply
```
### 5. クリーンアップする
```
$terraform destroy
```

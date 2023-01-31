# (WIP) Hinagata

Webやモバイルアプリの新規開発で使用するボイラープレートです。
作成するアプリは、社内システムなどクローズドな物を想定しています。

## 構成

| 環境              | 概要                                  | プロジェクト内のディレクトリ |
|-----------------|-------------------------------------|----------------|
| Backend(web)    | APIサーバー                             | backend/       |
| Backend(worker) | Workerサーバー                          | backend/       |
| Frontend(web)   | Webアプリ                              | frontend/      |
| Native          | モバイル(Android/iOS)アプリ                | native/        |
| DB              | MySQLサーバー、永続データを保持                  | docker/db/     |
| Cache           | Redisサーバー、セッション等をキャッシュ              | -              |
| Proxy           | Nginxサーバー、HTTPリクエストをBackend(web)に転送 | docker/web/    |

### 使用する主な技術

| 環境       | 言語         | フレームワーク           |
|----------|------------|-------------------|
| Backend  | PHP        | Laravel           |
| Frontend | Typescript | React, Redux      |
| Native   | Dart       | Flutter, Provider |

## 開発環境構築

開発環境はdocker、docker composeを使用して構築します。
これらの使い方がわからない場合は、事前にキャッチアップしましょう。

### ソースの取得

```shell
% git clone git@github.com:PaykeDeveloper/payke-hinagata.git
% cd payke-hinagata
```

### サブモジュールの取得

```shell
% git submodule update --init --recursive
```

### サブモジュールのブランチを切り替え

```shell
% cd backend/
% git checkout main
% cd ../frontend/
% git checkout main
% cd ../native/
% git checkout main
% cd ../
```

### .envファイルの作成、更新

```shell
% cp .env.example .env
```

コピーした.envファイルの内容を変更して下さい。
「!〜〜〜!」と記載された箇所が変更が必要な箇所です。
APP_KEYは、後ほど取得した値を設定するので一旦スキップしてOKです。
XXXX_PASSWORDに適当な値を設定して下さい。

### Dockerイメージのビルド

```shell
% docker compose build
```

### Backendの環境整備

```shell
% docker compose run backend-web sh
backend-web% composer install
backend-web% php artisan migrate
backend-web% php artisan key:generate --show
backend-web% php artisan db:seed
backend-web% php artisan storage:link
backend-web% composer publish
backend-web% composer helper
backend-web% exit
```

`php artisan key:generate --show`の実行結果(base64:〜〜〜)をAPP_KEYに設定して下さい。

### Frontendの環境整備

```shell
% cd frontend/
% cp .env.example .env
% npm install
```

### Nativeの環境整備

```shell
% cd native/
% brew install --cask flutter
% flutter doctor
% flutter pub get
% flutter pub run build_runner build --delete-conflicting-outputs
```

### 後処理

```shell
% docker compose down
```

## 起動方法

### Backendを起動

```shell
% docker compose up
```

### Frontendを起動

```shell
% cd frontend/
% npm run start
```

### Nativeを起動

```shell
% cd native/
% flutter run --dart-define=BACKEND_ORIGIN=http://localhost:8000
```

## 開発方法

Backend、Frontend、Nativeの各開発に関するTipsは、
各サブモジュール内のREADME.mdを参照して下さい。

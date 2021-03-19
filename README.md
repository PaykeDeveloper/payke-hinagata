# Payke Hinagata

新規開発を加速させる為のボイラープレートです。

## Installation

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

### Dockerイメージのビルド

```shell
% cp .env.example .env
% docker-compose build
```

### バックエンドの環境整備

```shell
% docker-compose run backend-web sh
backend-web% composer install
backend-web% php artisan migrate
backend-web% php artisan db:seed
backend-web% composer publish
backend-web% composer helper
backend-web% exit
```

※ `composer publish`は、APIを作成／変更／削除後にも実行します。 ※ `composer helper`は、`composer update`後、ソース最新化後、モデル更新後のも実行します。

### フロントエンドの環境整備

```shell
% docker-compose run frontend sh
frontend% yarn install
frontend% exit
```

### ネイティブの環境整備

```shell
% brew install --cask flutter
% flutter doctor
```

※ [公式ドキュメント](https://flutter.dev/docs/get-started/install/macos) を参照しましょう。

### 起動

```shell
% docker-compose up
```

## How to use

### 開発のみで利用可能なURL一覧

#### APIドキュメント

- http://localhost:8000/docs/

#### `phpinfo()`の結果

- http://localhost:8000/phpinfo/

#### デバッグログ

- http://localhost:8000/telescope/

#### メーラー

- http://localhost:8025/

### composer、artisanコマンドの一覧を確認

```shell
% docker-compose run backend-web sh
backend-web% composer list
backend-web% php artisan list
```

### ユーザー、トークンの作成コマンド

```shell
% docker-compose run backend-web sh
backend-web% php artisan user:create {email} {password}
backend-web% php artisan token:create {email} {password}
```

トークンをしすると、認証が必要なAPIも [ドキュメント](http://localhost:8000/docs/) で検証が可能です。

### その他、バックエンドの便利コマンド

#### 対話シェルを起動

```shell
backend-web% php artisan tinker
```

#### DBを初期化

```shell
backend-web% php artisan migrate:fresh
```

#### URL一覧を確認

```shell
backend-web% php artisan route:list
```

## Staging release

1. [バッグエンドの環境構築](https://payke.esa.io/posts/3147)
1. [フロントエンドの環境構築](https://payke.esa.io/posts/3146)
1. [DNSの環境構築](https://payke.esa.io/posts/3149)

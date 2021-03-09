# Payke Hinagata
新規開発を加速させる為のボイラープレートです。

## Installation
1. ソースの取得
    ```shell
    % git clone git@github.com:PaykeDeveloper/payke-hinagata.git
    % cd payke-hinagata
    ```

1. サブモジュールの取得
    ```shell
    % git submodule update --init --recursive
    ```

1. サブモジュールのブランチを切り替え
    ```shell
    % cd frontend/
    % git checkout main
    % cd ../backend/
    % git checkout main
    % cd ../
   ```

1. Dockerイメージのビルド
   ```shell
   % cp .env.example .env
   % docker-compose build
   ```

1. フロントエンドの環境整備
   ```shell
   % docker-compose run frontend sh
   frontend% yarn install
   frontend% exit
   ```

1. バックエンドの環境整備
   ```shell
   % docker-compose run backend-web sh
   backend-web% composer install
   backend-web% composer migrate
   backend-web% composer db:seed
   backend-web% composer publish
   backend-web% composer helper
   backend-web% exit
   ```
   ※ `composer publish`は、APIを作成／変更／削除後にも実行します。
   ※ `composer helper`は、`composer update`後、ソース最新化後、モデル更新後のも実行します。

1. 起動
   ```shell
   % docker-compose up
   ```


## How to use
### 開発のみで利用可能なURL一覧
1. APIドキュメント
   - http://localhost:8000/docs/
1. `phpinfo()`の結果
   - http://localhost:8000/phpinfo/
1. デバッグログ
   - http://localhost:8000/telescope/
1. メーラー
   - http://localhost:8025/

### composer、artisanコマンドの一覧を確認
```shell
% docker-compose run backend-web sh
backend-web% composer list
backend-web% php artisan list
```

### ユーザー、トークンの作成
```shell
% docker-compose run backend-web sh
backend-web% php artisan user:create {email} {password}
backend-web% php artisan token:create {email} {password}
```
トークンをしすると、認証が必要なAPIも [ドキュメント](http://localhost:8000/docs/) で検証が可能です。

## Staging release
1. [バッグエンドの環境構築](https://payke.esa.io/posts/3147)
1. [フロントエンドの環境構築](https://payke.esa.io/posts/3146)
1. [DNSの環境構築](https://payke.esa.io/posts/3149)
 
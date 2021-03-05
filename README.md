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
   backend-web% composer helper
   backend-web% exit
   ```
   ※ `composer helper`は、モデルを更新した際、ソースの取得を行った際も実行しましょう。

1. 起動
   ```shell
   % docker-compose up
   ```


## How to use
### artisanコマンドの一覧を確認
```shell
% docker-compose run backend-web sh
backend-web% php artisan list
```

### ユーザーの作成
```shell
% docker-compose run backend-web sh
backend-web% php artisan user:create {email} {password}
```

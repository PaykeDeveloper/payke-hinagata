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
   % docker-compose run backend sh
   backend% php composer.phar install
   backend% cp .env.example .env
   backend% php artisan key:generate
   backend% php artisan migrate
   backend% exit
   ```

1. 起動
   ```shell
   % docker-compose up
   ```

# アマガミAPI

## 概要

アマガミのデータを取得するAPI

* Elixir バージョン 1.16.1
* Erlang バージョン 26
* フレームワーク Phoenix バージョン
* データベース Sqlite3
* Docker
* Makefile

## 環境構築

* Dockerを使用してコンテナを作成、起動

  ```bash
  make setup
  ```

* サーバーを起動

  ```bash
  make server
  ```

* [アクセス](http://localhost:4000/)

  ```
  http://localhost:4000/
  ```
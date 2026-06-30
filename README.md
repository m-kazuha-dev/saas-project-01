# SaaS-Project-01

## 概要
本プロジェクトは、PHPとDockerを用いたWebアプリケーションです。従業員情報のCRUD機能を実装しています。Dockerによる環境のコンテナ化やGitを用いた管理フローを採用し、実務を想定した再現性の高い開発基盤を構築しています。

**現在は、Laravelフレームワークへのリプレイスを通じたアーキテクチャの高度化を実施中です。**
## 開発の目的
現職の税務・基幹システム開発で培った業務ドメイン知識を、モダンなWeb開発技術（PHP/Docker/Laravel）と融合させ、バックオフィス系SaaS企業のエンジニアとして貢献することを目標としています。

## プロジェクト構造
```Plaintext
saas-project-01/
├── .gitignore              # Git管理外ファイルの指定
├── README.md               # プロジェクト概要・起動方法
├── docker/                 # インフラ環境設定
│   ├── mysql/
│   │   └── init.sql        # DB初期化スクリプト
│   ├── php/
│   │   └── Dockerfile      # PHP環境定義
│   └── docker-compose.yml  # コンテナ構成管理
├── docs/                   # ドキュメント類
│   ├── images/             # ドキュメント用画像
│   └── (各詳細ドキュメント)
└── src/                    # アプリケーションソースコード
```

## システム構成
Webサーバー層とデータ層を分離した、実務に近いアーキテクチャを採用しています。
* App Container: PHP 8.2 / Apache
* DB Container: MySQL 8.0

## 動作イメージ

### 一覧表示画面
![一覧表示](docs/images/list-view.png)

### 編集画面
![編集画面](docs/images/edit-form.png)

## 起動方法 (Quick Start)

1. GitHubからクローン
   ```bash
   git clone https://github.com/m-kazuha-dev/saas-project-01.git
   cd saas-project-01
   ```
2. Docker環境のビルドと起動
   ```bash
   docker-compose up -d --build
   ```
3. 動作確認
ブラウザで http://localhost:8080/ にアクセスしてください。

## 技術的判断

* Dockerの採用: 環境依存のバグ排除と再現性の担保。
* コンテナ間通信: DockerのDNS機能を用いてサービス名 db で名前解決を実装。
* 文字コードの統一: utf8mb4 を採用し、将来的なマルチバイト文字の取り扱いにおける堅牢性を確保。

## 開発の記録

詳細は docs/CHANGELOG.md を参照してください。
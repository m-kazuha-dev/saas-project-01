# SaaS-Project-01
一時退避

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

## 技術的判断

* Dockerの採用: 環境依存のバグ排除と再現性の担保。
* コンテナ間通信: DockerのDNS機能を用いてサービス名 db で名前解決を実装。
* 文字コードの統一: utf8mb4 を採用し、将来的なマルチバイト文字の取り扱いにおける堅牢性を確保。
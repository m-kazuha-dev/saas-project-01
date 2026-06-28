# SaaS-Project-01

## 概要
本プロジェクトは、税務・基幹業務の知見とWeb開発スキルを掛け合わせた、バックオフィス系SaaSのプロトタイプです。
Dockerを用いたコンテナ環境とGitによるバージョン管理を徹底し、保守性の高い開発フローの習得を目的としています。

## システム構成
Webサーバー層とデータ層を分離した、実務に近いアーキテクチャを採用しています。
* ブラウザ -> HTTP: 8080 -> appコンテナ (PHP 8.2 / Apache)
* appコンテナ -> PDO / MySQL接続 -> dbコンテナ (MySQL 8.0)

※ Web層とデータ層を分離し、疎結合な設計を意識しています。

## 技術的判断

### なぜDockerを使用したか
開発環境と本番環境のOSやミドルウェアの差異による「環境依存のバグ」を排除し、チーム開発における環境構築の再現性を担保するためです。

### なぜMySQLの接続先に `db` を指定したか
Dockerのネットワーク環境下において、`localhost` はPHPコンテナ自体を指してしまいます。コンテナ間通信を行うために、DockerのDNS機能を用いてサービス名 `db` で名前解決を行っています。

## 起動方法 (Quick Start)

1. GitHubからクローン
   ```bash
   git clone [https://github.com/m-kazuha-dev/saas-project-01.git](https://github.com/m-kazuha-dev/saas-project-01.git)
   cd saas-project-01
2. Docker環境のビルドと起動
   ```bash
   docker-compose up -d --build
3. 動作確認
ブラウザで http://localhost:8080/ にアクセスしてください。「Connected!」と表示されれば成功です。

## プロジェクト構造
```Plaintext
/saas-project-01
├── docker-compose.yml  # Dockerの設定
├── Dockerfile          # コンテナ構築の定義
├── .gitignore          # Git管理除外設定
├── README.md           # プロジェクト説明書
└── src/                # PHPのソースコード
    └── index.php       # メイン処理
```
## 開発の記録
* 1日目: DockerによるPHP実行環境の構築と、ホストPCとのディレクトリ同期（Volumes）の実装。
* 2日目: Web層とデータ層を分離したコンテナ構築、およびPHPとMySQLの疎通確認。

## 開発の目的
現職で培った税務・基幹システムの業務知識を、モダンなWeb開発技術（PHP/Docker）と融合させ、バックオフィス系SaaS企業の即戦力エンジニアを目指すためのポートフォリオ。
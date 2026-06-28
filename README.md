# SaaS-Project-01

## 概要
本プロジェクトは、税務・基幹業務の知見とWeb開発スキルを掛け合わせた、バックオフィス系SaaSのプロトタイプです。  
Dockerを用いたコンテナ環境とGitによるバージョン管理を徹底し、保守性の高い開発フローの習得を目的としています。

## 技術スタック
* Language: PHP 8.3
* Container: Docker / Docker Compose
* Version Control: Git

## 起動方法 (Quick Start)
開発環境の立ち上げ手順は以下の通りです。

1. プロジェクトを配置後、ターミナルで以下のコマンドを実行
   ```bash
   docker-compose up -d 
2. **ブラウザでアクセス**以下のURLへアクセスしてください。  
http://localhost:8000

## プロジェクト構造
```Plaintext
/saas-project-01
├── docker-compose.yml  # Dockerの設定・設計図
├── .gitignore          # Git管理除外設定
├── README.md           # プロジェクト説明書
└── src/                # ビジネスロジック（PHPソース）
    └── index.php       # メイン処理
```
## 開発の記録
* 1日目: DockerによるPHP実行環境の構築と、ホストPCとのディレクトリ同期（Volumes）の実装。
* 2日目: Gitによる履歴管理の導入。コミットログを用いた論理的な開発サイクルの確立。
* 3日目: ビジネスロジックの実装およびドキュメントの完成。

## 開発の目的
現職で培った税務・基幹システムの業務知識を、モダンなWeb開発技術（PHP/Docker）と融合させ、バックオフィス系SaaS企業の即戦力エンジニアを目指すためのポートフォリオ。
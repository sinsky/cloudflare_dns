現在のREADMEは簡潔ですが、いくつか追加・修正すべき点があります。特にTurso DBを使用していることを考慮して、以下のように修正しましょう：

```markdown
# CloudFlare DNS configure for Terraform

このリポジトリはTerraformを使用してCloudFlare DNSの設定を管理するためのコードを含んでいます。

## 前提条件

- Terraform v1.0.0以上
- NeonDBへのアクセス
- CloudFlareアカウントとAPI認証情報

## セットアップ

### 1. 環境変数の設定

```sh
# .envファイルのテンプレートをコピー
cp .env.example .env

# .envファイルを編集
nvim .env
```

`.env`ファイルには以下の変数を設定してください：

```
# PostgreSQL接続文字列（NeonDB用）
PG_CONN_STR=postgres://cftf_owner:password@your-neon-db.region.provider.neon.tech/cftf?sslmode=require

# CloudFlare認証情報（必要に応じて）
CLOUDFLARE_API_TOKEN=your_api_token
```

### 2. 環境変数の読み込み

Terraformを実行する前に、必ず環境変数を読み込んでください：

```sh
# 環境変数を読み込む
export $(cat .env | xargs)
```

### 3. Terraformの実行

```sh
# 初期化（初回または設定変更時）
terraform init

# 変更内容の確認
terraform plan

# 変更の適用
terraform apply
```


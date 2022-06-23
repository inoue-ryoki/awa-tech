## アプリケーション概要

### アプリケーション名 
  AwaTech

### アプリケーションの概要(コンセプト)
  
  プログラミング教室に行ってみたい、子供を通わせたいがどこに行けば良いのかわからない。
  また、プログラミング教室をしているが集客が難しい。

  この二つの課題を解決するアプリになっています。
  徳島県内の教室を探すことができたり
  先生と生徒が気軽にチャットでコミュニケーションをとることができます。

## アプリケーションの利用方法

### URL(デプロイ)


### テスト用アカウント


### 利用方法

①新規登録・ログインする

②教室情報の記事を投稿・閲覧をする

③気になった記事のページをクリックして詳細ページでチャットを開始するボタンを押す

④DMでやりとりする。




## 要件定義

### アプリケーションを作成した背景

友人がプログラミング教室を始めて、集客が難しいと聞きました。

そこで、プログラミングの教室があることを、世間に知られていない、また実際に行くのには
ハードルがあると考え気軽に生徒と先生チャットができれば教室のことも知ることができるので作成しました。




## DB設計


## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| school_name                | string | null: false |
| address                    | string | null: false |
| telephone_number           | string | null: false |
| teacher_name               | string | null: false |
| school_content             | string | null: false |

### Association

- has_many :posts
- has_many :rooms, through: :entries
- has_many :messages



## posts テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   | string | null: false |

### Association
- belongs_to :user


## rooms テーブル

| Column | Type       | Options                        |
| ------ | ------     | -------------------------------|
| user   | references | null: false, foreign_key: true |

### Association

- has_many :entries
- has_many :users, through: :entries
- has_many :messages

## entries テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


## 開発環境

HTML5,CSS3,Ruby,Ruby on Rails,AWS,EC2,S3,MariaDB

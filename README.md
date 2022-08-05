## アプリケーション名 
  AwaTech

## URL(デプロイ)
http://awa-tech-aws.com/

## アプリケーションの概要(コンセプト)
  生徒⇨今流行しているプログラミングを勉強してみたいのでプログラミング教室に行ってみたい、親が子供を教室に通わせたいがどこに行けば良いのかわからない。

  先生⇨プログラミング教室の集客が難しい。WEBサイトを作るのはコストがかかる。

  この二つの課題を解決するアプリになっています。
  徳島県内の教室を探すことができたり
  先生と生徒が気軽にチャットでコミュニケーションをとることができます。
## 使用技術

- フロントエンド
  -  HTML5/CSS3
  -  JavaScript
- バックエンド
  - Ruby 2.6.5
  - Ruby on Rails 6.0.5
  - Rubocop(コード解析ツール)
  - RSpec(テスト)
- インフラ・開発環境 
  - AWS(VPC,EC2,S3,Route53)
  - Capistrano
- データベース
  - Mariadb


## アプリケーションの利用方法




## 利用方法
### 教室情報掲載

①新規登録・ログインする。ゲストログイン（閲覧用）ボタンを押すとログインできます。

②教室の掲載したい人はこちらというボタンを押すと、画像とテキストを入力して教室の情報を投稿できます。

### DM機能
①気になった教室の記事のページをクリックして詳細ページに遷移します。

②チャットへというボタンを押すと、DM画面で１対１でチャットすることができます。

③ヘッダーのマイページを押して自分のマイページに遷移し、DM一覧ボタンを押すと、自分がDMした人一覧とメッセージ内容が確認できます。






## アプリケーションを作成した背景

友人がプログラミング教室を始めて、集客が難しいと聞きました。
（チラシを貼ったり、新聞にチラシを挟むが集客できない）

問題点として、以下の仮説を立てました。
- 新聞にチラシを挟んでもみる人が少ない可能性。見る人は年配の人が多く、若い世代で見る世代が減っている。
- 教室が存在することを、知られていない
- チラシだけでは、教室の先生の事をよく分からないし不安が多い。

解決方法として
- インターネットで教室があることを知ってもらう
- 先生と直接チャットでコミュニケーションを取ることで、先生の人柄や教室の内容を知ってもらう。

このような背景から、教室の情報を掲載できて、先生と生徒がチャットできるアプリケーションを作成しました。

## 洗い出した要件

https://docs.google.com/spreadsheets/d/1j_iKoNoY0_ER8la6c4Mu0XfEp4xleKqHMGwlQ-uuTOs/edit#gid=982722306



## 実装した機能についてのGIF
### DM機能
[![Image from Gyazo](https://i.gyazo.com/1c7046ceab98fba31db588dd244b9a5f.gif)](https://gyazo.com/1c7046ceab98fba31db588dd244b9a5f)

### 教室情報掲載機能
[![Image from Gyazo](https://i.gyazo.com/59ad6b40162da583fe6de61ec79bb776.gif)](https://gyazo.com/59ad6b40162da583fe6de61ec79bb776)

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/9913f295efe447b7c180058275696c26.png)](https://gyazo.com/9913f295efe447b7c180058275696c26)



## DB設計
[![Image from Gyazo](https://i.gyazo.com/1c758d570bdc6c259c56b3de78c0b150.png)](https://gyazo.com/1c758d570bdc6c259c56b3de78c0b150)


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

## relationships テーブル

| Column     | Type       | Options           |
| ------     | ------     | ------------------|
| follower   | references | foreign_key: true |
| followed   | references | foreign_key: true |



## posts テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   | string | null: false |

### Association
- belongs_to :user


## rooms テーブル


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

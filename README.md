

## アプリケーション名 
  AwaTech

## アプリケーションの概要(コンセプト)
  
  生徒⇨今流行しているプログラミングを勉強してみたいのでプログラミング教室に行ってみたい、子供を通わせたいがどこに行けば良いのかわからない。

  先生⇨プログラミング教室の集客が難しい。WEBサイトを作るのはコストがかかる。

  この二つの課題を解決するアプリになっています。
  徳島県内の教室を探すことができたり
  先生と生徒が気軽にチャットでコミュニケーションをとることができます。

## アプリケーションの利用方法

## URL(デプロイ)
http://awa-tech-aws.com/

## テスト用アカウント


## 利用方法
### 教室情報掲載

①新規登録・ログインする。テスト用アカウントを使用していただくとログインできます。

②教室の掲載したい人はこちらというボタンを押すと、画像とテキストを入力して教室の情報を投稿できます。

### DM機能
①気になった教室の記事のページをクリックして詳細ページに遷移します。

②チャットへというボタンを押すと、DM画面で１対１でチャットすることができます。

③ヘッダーのマイページを押して自分のマイページに遷移し、DM一覧ボタンを押すと、自分がDMした人一覧とメッセージ内容が確認できます。






## アプリケーションを作成した背景

友人がプログラミング教室を始めて、集客が難しいと聞きました。

そこで、プログラミングの教室があることを、世間に知られていない、また実際に行くのには
ハードルがあると考え気軽に生徒と先生チャットができれば教室のことも知ることができるので作成しました。

## 洗い出した要件

https://docs.google.com/spreadsheets/d/1j_iKoNoY0_ER8la6c4Mu0XfEp4xleKqHMGwlQ-uuTOs/edit#gid=982722306



## 実装した機能についてのGIF

## 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/3cac493de6aa2cca6797dc8ab717dde2.png)](https://gyazo.com/3cac493de6aa2cca6797dc8ab717dde2)



## DB設計
[![Image from Gyazo](https://i.gyazo.com/a554b890c7cdf9b7cd948ba272e82f49.png)](https://gyazo.com/a554b890c7cdf9b7cd948ba272e82f49)


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

- フロントエンド HTML5,CSS3
- バックエンド Ruby,Ruby on Rails
- インフラ AWS,EC,S3,Route53,Mariadb
- テスト RSpec
- テキストエディタ VScode

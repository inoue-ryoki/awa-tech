# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :posts
- has_many :rooms, through: :entries
- has_many :messages
- has_one  :profile

## profiles テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| school_name        | string | null: false |
| address            | string | null: false |
| telephone_number   | string | null: false |
| name               | string | null: false |
| school_content     | string | null: false |

### Association

- belongs_to :user

## posts テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   | string | null: false |

### Association
- belongs_to :user


## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user   | string | null: false |

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

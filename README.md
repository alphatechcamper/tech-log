# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
<!-- | last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| user_birth_date    | date    | null: false               | -->

### Association

- has_many :reports

## reports テーブル

| Column                 | Type        | Options                        |
| ---------------------- | ----------- | ------------------------------ |
| content                | string      | null: false                    |
| create_date            | text        | null: false                    |
| user                   | references  | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user


## errors テーブル

| Column                   | Type        | Options                        |
| ------------------------ | ----------- | ------------------------------ |
| user                     | references  | null: false, foreign_key: true |
| item                     | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


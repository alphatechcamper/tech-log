# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many :posts

## posts テーブル

| Column                 | Type        | 
| ------------------     | -------     | 
| title                  | string      |
| content                | text        |
| user_id                | integer     |


### Association

- belongs_to :user
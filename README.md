# アプリケーション名
[![Image from Gyazo](https://i.gyazo.com/3730f5ec39be0a10c57b3d4a0e7dfe5a.png)](https://gyazo.com/3730f5ec39be0a10c57b3d4a0e7dfe5a)

# アプリケーション概要
プログラミングスクール「TECHCAMP」において、提出したレポートを効果的に管理し<br>
振り返りや検索を容易にできるサービスです。
<p>
またカリキュラムで経験されたエラーを記録代わりに残すことで<br>
自分自身のインプットにもなり、他受講生のエラー解決の参考にもなり得ると考えています。



# URL
現在開発途中です。



# テスト用アカウント
・Basic認証ID：admin <br>
・Basic認証パスワード：2222 <br>
・メールアドレス：aaa@aaa <br>
・パスワード：111aaa


# 利用方法


### レポート投稿
1.トップページのヘッダーから新規登録を行います <br>
2.新規投稿ボタンからレポートの内容（キーワード、内容）を入力し投稿することができます <br>
3.一覧ページに投稿したレポートが表示され、詳細ボタンより詳細を確認することができます



### 検索機能
1.トップページ上部の検索フォームから任意のワードで検索ができます


# アプリケーションを作成した背景
スクール内では4種類のレポートを提出する必要があり、ひたすら提出するだけでレポート自体を振り返る機会がありませんでした。<br>いざ振り返ろうとした際に、少し読みにくいと感じ、もう少し読みやすいフォーマットに変えたりレポートを種類ごとに分けたり<br>
特定のワードで検索をかけることができたら便利そうだと感じました。<br>
また他の受講生がどのような文面や視点でアウトプットされているのか気になり、カリキュラムなどで経験するエラーを記録代わりに残し共有することで<br>
よりインプット・アウトプット両面での質を良くできるのではと思い、制作をすることにしました。

# 洗い出した要件
要件を定義したシート
https://docs.google.com/spreadsheets/d/14NEfg3wG5ntr50AQCeko_iebIFkQfK8FhO-3KLGgUA0/edit#gid=982722306

# 実装予定の機能
現在、レポートのカテゴリー分け機能を実装中です。<br>
今後は投稿されたレポートに対してユーザー同士が気軽に意思表示できるように「いいね機能」を実装予定です。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/1a8f84290c6d4ff8006464ead67cfd0c.png)](https://gyazo.com/1a8f84290c6d4ff8006464ead67cfd0c)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/506bb4fc216bdc025f1f6b895d83a690.png)](https://gyazo.com/506bb4fc216bdc025f1f6b895d83a690)

# 開発環境
・フロントエンド(HTML,CSS,JavaScript)<br>
・バックエンド(Ruby(7.0.0)/Ruby on Rails)<br>
・テキストエディタ (Visual Studio Code)


# 工夫したポイント
主にデザイン面において意識しており、ロゴはCanvaを用いて自作しました。<br>
シンプルをベースに「白グレー」を基調にした配色にし、ボタンは見やすい配色に設定しました。


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
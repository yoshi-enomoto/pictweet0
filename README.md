# Pictweet

画像にコメントを入れて投稿するアプリケーション

## 機能
- 投稿機能
- ユーザー登録機能
- コメント機能

## 追加機能
- ユーザープロフィール詳細投稿機能
- ユーザープロフィールに他ユーザーからの書き込み機能

## 特記事項
- 今回、外部キーを想定しているカラムはマイグレーションファイルでは特に設定せずに実行。
- 個人的復習、振り返りを兼ねて、随所にうっとおしいくらいコメントを追記。


# Structure of DataBase

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|text||
|email|string|unique: true|
|password|string|null: false|

### Association
- has_many :tweets
- has_many :comments
- has_one  :detail
- has_many :posts


## Tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false（バリデートにて対応）|
|image|text|null: false（バリデートにて対応）|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments


## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|tweet_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet


## Detailsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|body|text||
|gender|integer||
|birthday|date||
|hometown|string||

### Association
- belongs_to :user
- has_many   :posts


## Postsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|detail_id|integer|null: false, foreign_key: true|
|text|text||

### Association
  belongs_to :user
  belongs_to :detail


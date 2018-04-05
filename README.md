# Pictweet

画像にコメントを入れて投稿するアプリケーション

## 機能
- 投稿機能
- ユーザー登録機能
- コメント機能


#Structure of DataBase

## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|text||
|email|string|unique: true|
|password|string|null: false|

### Association
- has_many :tweets
- has_many :comments


## Tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|text|null: false|
|user|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :comments


## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|null: false|
|tweet|references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :tweet

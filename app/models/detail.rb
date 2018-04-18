class Detail < ActiveRecord::Base

  enum gender: { 秘密: 0, 男性:1, 女性:2, その他:9 }
  # enum：列挙型
  # keyとvalueに分けられたデータを列挙することができる。

  # I reference user.：私側は相手先のidを持つ。
  belongs_to :user
  has_many   :posts
end

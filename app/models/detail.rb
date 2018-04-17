class Detail < ActiveRecord::Base

  enum gender: { 秘密: 0, 男性:1, 女性:2, その他:9 }
  # enum：列挙型
  # keyとvalueに分けられたデータを列挙することができる。
end

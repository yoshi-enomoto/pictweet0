class Detail < ActiveRecord::Base

  enum gender: { unknown: 0, male:1, female:2, other:9 }
  # enum：列挙型
  # keyとvalueに分けられたデータを列挙することができる。
end

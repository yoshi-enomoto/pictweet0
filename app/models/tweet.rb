class Tweet < ActiveRecord::Base
  # アソシエーションの設定
  belongs_to :user
  # 紐付く『所属するクラス名_id』が設定されている。
  has_many   :comments
end

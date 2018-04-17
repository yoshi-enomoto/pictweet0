class Tweet < ActiveRecord::Base
  # アソシエーションの設定
  belongs_to :user
  # 紐付く『所属するクラス名_id』が設定されている。
  # Many user references me.：相手は私のidを持つ。
  has_many   :comments

  validates :text, :image , presence: true
end

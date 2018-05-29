class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # アソシエーションの設定
  # Many user references me.：相手は私のidを持つ。
  has_many :tweets
  # 所属側のテーブルに『所属するクラス名_id』カラムが存在している事。
  # 所属側（tweets）に『所属するクラス名（user）_id』カラムがある。
  has_many :comments

  # One user references me.：belongs_to側が相手を参照している。
  has_one  :detail
  has_many :posts

  # バリデートの設定
  validates :nickname, presence: true, length: { maximum: 6 }
end

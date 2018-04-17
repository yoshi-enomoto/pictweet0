class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # アソシエーションの設定
  has_many :tweets
  # 所属側のテーブルに『所属するクラス名_id』カラムが存在している事。
  # 所属側（tweets）に『所属するクラス名（user）_id』カラムがある。
  has_many :comments
end

class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      #『t.型      :カラム名』で定義
      t.string    :name
      t.text      :text
      t.text      :image
      # 『null:false』を削除
      t.timestamps
    end
  end
end

# 下記、スキーマファイルの初期状態
# ActiveRecord::Schema.define(version: 0) do

# end

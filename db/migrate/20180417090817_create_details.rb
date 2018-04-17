class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details do |t|
      t.integer  :user_id
      t.text     :body
      t.integer  :gender
      t.date     :birthday
      t.string   :hometown
      t.timestamps
    end
  end
end

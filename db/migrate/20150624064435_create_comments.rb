class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :post_id
      t.text :content

      t.timestamps null: false
    end
  end
end

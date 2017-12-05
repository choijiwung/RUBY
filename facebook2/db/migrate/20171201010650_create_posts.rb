class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: ""
      t.text :content, null: false, default: ""
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end

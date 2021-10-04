class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :location
      t.string :address
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end

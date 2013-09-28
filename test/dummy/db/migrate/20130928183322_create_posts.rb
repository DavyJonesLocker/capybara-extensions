class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :id
      t.string :title
      t.text :body
      t.string :author
    end
  end
end

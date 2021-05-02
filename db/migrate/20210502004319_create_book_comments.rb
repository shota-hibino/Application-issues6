class CreateBookComments < ActiveRecord::Migration[5.2]
  def change
    create_table :book_comments do |t|
      t.text :comment
      t.integer :user_comment_id
      t.integer :profile_comment_image_id

      t.timestamps
    end
  end
end

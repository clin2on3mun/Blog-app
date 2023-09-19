# frozen_string_literal: true

# This is your top-level documentation comment for the module.
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :comments_counter, null: false
      t.interger :likes_counter, null: false
      t.timestamps
    end
  end
end

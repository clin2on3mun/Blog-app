# frozen_string_literal: true

# This is your top-level documentation comment for the module.
class AddPostRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post, null: false, foreign_key: true
  end
end

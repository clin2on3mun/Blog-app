# frozen_string_literal: true

# This is your top-level documentation comment for the module.
class RenameUserToAuthor < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :user_id, :author_id
  end
end

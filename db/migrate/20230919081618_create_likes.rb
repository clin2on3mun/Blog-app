# frozen_string_literal: true

# This is your top-level documentation comment for the module.
class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes, &:timestamps
  end
end

# frozen_string_literal: true

# This is your top-level documentation comment for the module.
class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.boolean :is_private, default: true
      t.string :name
      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.time :read_at
      t.references :user, index: true, foreign_key: true
      t.references :conversation, index: true, foreign_key: true
      t.timestamps
    end
  end
end

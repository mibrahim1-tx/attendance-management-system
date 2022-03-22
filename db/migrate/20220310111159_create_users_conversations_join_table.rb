# frozen_string_literal: true

class CreateUsersConversationsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :conversations
  end
end

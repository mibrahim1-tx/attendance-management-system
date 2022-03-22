# frozen_string_literal: true

class AddAttributesToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :designation, :string
    add_column :users, :company_name, :string
    add_column :users, :role, :integer
  end
end

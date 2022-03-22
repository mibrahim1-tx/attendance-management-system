# frozen_string_literal: true

class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.integer :main_type
      t.integer :sub_type
      t.string :reason
      t.boolean :paid
      t.date :leave_duration
      t.date :leave_on
      t.integer :status
      t.datetime :checked_in
      t.datetime :checked_out

      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end

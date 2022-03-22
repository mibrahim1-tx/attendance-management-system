# frozen_string_literal: true

class AddCheckInAndCheckOutBooleanToAttendance < ActiveRecord::Migration[6.1]
  def change
    rename_column :attendances, :checked_in, :check_in_time
    rename_column :attendances, :checked_out, :check_out_time
    add_column :attendances, :check_in, :boolean
    add_column :attendances, :check_out, :boolean
  end
end

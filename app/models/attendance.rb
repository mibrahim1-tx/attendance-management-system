# frozen_string_literal: true

class Attendance < ApplicationRecord
  enum main_type: %i[leave holiday]
  enum sub_type: %i[admin hr employee]

  scope :present_users, -> { where.not(check_in_time: nil) }
  scope :absent_users, -> { where('main_type = 0 OR main_type = 1', :leave, :holiday) }
  belongs_to :user
end

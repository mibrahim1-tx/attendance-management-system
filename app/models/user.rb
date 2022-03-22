# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true

  enum role: %i[admin hr employee]

  has_many :attendances
  has_many :messages
  has_and_belongs_to_many :conversations

  scope :all_except, ->(user) { where.not(id: user) }

  def full_name
    first_name + last_name
  end
end

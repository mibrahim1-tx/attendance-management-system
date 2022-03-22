# frozen_string_literal: true

module ApplicationHelper
  def conversation_name(conversation)
    user_ids = conversation.users.ids
    user_ids.delete(current_user.id)
    user = User.find_by(id: user_ids.first)
    user.try(:first_name)&.first(2)
  end
end

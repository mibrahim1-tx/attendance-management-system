# frozen_string_literal: true

class MessagesController < ApplicationController
  def create
    @conversation = Conversation.find_by(id: params[:message]['conversation_id'])
    if @conversation.messages.create(body: params[:message]['body'], user_id: params[:message]['user_id'])
      message = @conversation.messages.last
      ActionCable.server.broadcast('room_channel',
                                   { msg: message, sender_name: message.user.first_name,
                                     sent_time: message.created_at.strftime('%I:%M %p') })
    end
  end
end

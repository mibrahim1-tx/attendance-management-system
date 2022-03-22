# frozen_string_literal: true

class ConversationsController < ApplicationController
  def index
    @users = User.all_except(current_user)
    @conversations = current_user.conversations.order(:desc, :id)
    @conversation = params['conversation_id'].present? ? Conversation.find_by(id: params['conversation_id']) : @conversations.last
  end

  def create
    @conversation = current_user.conversations.create(name: params[:conversation_name])
    @conversation.users << User.find_by_id(params[:user_id])
    @conversation.messages.create(body: params[:message_text], user_id: current_user.id)
    redirect_to conversations_path
  end
end

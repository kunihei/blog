class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:user)
  end

  def new
    @message = Message.new
  end

  def create
    Message.create(message_params)
    redirect_to root_path
  end

  private
  def message_params
    params.require(:message).permit(:name, :text, :image).merge(user_id: current_user.id)
  end
end

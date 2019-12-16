class MessageController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    Messages.create(message_params)
  end

  private
  def message_params
    params.require(:message).permit(:title, :text, :image)
  end
end

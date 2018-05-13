class ConversationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversation_#{params[:sender_id]}_#{params[:receiver_id]}"
  end
end

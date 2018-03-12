class Message < ApplicationRecord
  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'
  after_create :broadcast_message

  validates :content, presence: true

  def broadcast_message
    ActionCable.server.broadcast("conversation_#{self.receiver.id}_#{self.sender.id}", {
      message_partial: ApplicationController.renderer.render(partial: 'shared/received_message', locals: { message: self })
    })
  end
end

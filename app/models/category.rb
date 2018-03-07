class Category < ApplicationRecord
  has_many :user_tags
  has_many :event_tags
end

class Talk < ApplicationRecord
  include PgSearch
  has_many :user_talks
  has_many :event_talks
end

class Event < ApplicationRecord
  belongs_to :user
  has_many :user_bookings, dependent: :destroy
  has_many :speaker_bookings, dependent: :destroy
  has_many :categories
  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_postcode?
end

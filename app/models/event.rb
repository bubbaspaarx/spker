class Event < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :user_bookings, dependent: :destroy
  has_many :speaker_bookings, dependent: :destroy
  has_many :event_tags, dependent: :destroy
  has_many :event_talks, dependent: :destroy
  has_many :categories, through: :event_tags
  has_many :talks, through: :event_talks
  has_many :invites, dependent: :destroy
  has_many :photos
  geocoded_by :postcode

  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true, format: { with: /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9]?[A-Za-z]))))\s?[0-9][A-Za-z]{2})/ }
  validates :start_date, presence: true
  validates :end_date, presence: true

  after_validation :geocode, if: :will_save_change_to_postcode?
end

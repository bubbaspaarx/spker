class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :user_bookings, dependent: :destroy
  has_many :speaker_bookings, dependent: :destroy
  has_many :categories
  geocoded_by :postcode
  after_validation :geocode, if: :will_save_change_to_postcode?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

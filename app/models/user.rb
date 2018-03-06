class User < ApplicationRecord
  has_many :events, dependent: :destroy
  has_many :user_bookings, dependent: :destroy
  has_many :speaker_bookings, dependent: :destroy
  has_many :categories
  geocoded_by :postcode
  monetize :cost_cents

  # validates :title, presence: true
  # validates :first_name, presence: true
  # validates :last_name, presence: true
  # validates :address, presence: true
  # validates :postcode, presence: true, format: { with: /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9]?[A-Za-z]))))\s?[0-9][A-Za-z]{2})/ }

  after_validation :geocode, if: :will_save_change_to_postcode?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

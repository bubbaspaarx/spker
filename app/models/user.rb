class User < ApplicationRecord
  include PgSearch
  module ActiveModel::Validations::HelperMethods
    def validates_email(*attr_names)
      validates_with EmailValidator, _merge_attributes(attr_names)
    end
  end
  before_create :capitalize_names
  after_create :send_welcome_email, :send_notification_email

  mount_uploader :photo, PhotoUploader
  has_many :events, dependent: :destroy
  has_many :user_bookings, dependent: :destroy
  has_many :speaker_bookings, dependent: :destroy
  has_many :user_tags, dependent: :destroy
  has_many :user_talks, dependent: :destroy
  has_many :categories, through: :user_tags
  has_many :talks, through: :user_talks
  has_many :user_photos, dependent: :delete_all
  has_many :invites, dependent: :destroy
  accepts_nested_attributes_for :user_photos

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'
  geocoded_by :postcode
  monetize :cost_cents

  # validates :title, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true, if: :is_speaker?
  validates :postcode, presence: true, format: { with: /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9]?[A-Za-z]))))\s?[0-9][A-Za-z]{2})/ }, if: :is_speaker?
  validates :travel_distance, presence: true, if: :is_speaker?
  validates :cost, presence: true, if: :is_speaker?

  validates_email :email


  after_validation :geocode, if: :will_save_change_to_postcode?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[facebook]

  scope :cost, -> (cost) { where("cost_cents <= ?", cost.to_i * 100) }

  pg_search_scope :search_by_full_name,
  against: [ :first_name, :last_name ],
  using: {
    tsearch: { prefix: true }
  }

  def is_speaker?
    self.is_speaker
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  private

  def capitalize_names
    self.first_name = first_name.capitalize
    self.last_name = last_name.capitalize
  end

  def send_welcome_email
    UserMailer.welcome(self).deliver_now!
  end

  def send_notification_email
    UserMailer.new_user(self).deliver_now!
  end


  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.remote_photo_url = auth.info.image # assuming the user model has an image
        # If you are using confirmable and the provider(s) you use validate emails,
        # uncomment the line below to skip the confirmation emails.
        user.skip_confirmation!
      end
    end
  end

end

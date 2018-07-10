class UserTalk < ApplicationRecord
  include PgSearch

  belongs_to :user
  belongs_to :talk

  pg_search_scope :talk_search, :associated_against => { :talk => :name }
end

class UserTag < ApplicationRecord
  include PgSearch

  belongs_to :user
  belongs_to :category

  pg_search_scope :tag_search, :associated_against => { :category => :name }
end

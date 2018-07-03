class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :privacy_policy, :terms ]
  def home
  end
  def privacy_policy
  end
  def terms
  end
end

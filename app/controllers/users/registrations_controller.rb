class Users::RegistrationsController < Devise::SessionsController

  def create
    resource = warden.authenticate!(scope: resource_name, recall: 'users/registrations#redirect_after_failure')
    set_flash_message :notice, :signed_up
    sign_up_and_redirect(resource_name, resource)
  end

  def redirect_after_failure
    redirect_to new_user_registration_path(active_tab: 'signup')
  end
end

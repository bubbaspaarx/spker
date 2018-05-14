class Users::SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate!(scope: resource_name, recall: 'users/sessions#redirect_after_failure')
    set_flash_message :notice, :signed_in
    sign_in_and_redirect(resource_name, resource)
  end

  def redirect_after_failure
    redirect_to new_user_session_path(active_tab: 'login')
    set_flash_message :notice, :error
  end
end

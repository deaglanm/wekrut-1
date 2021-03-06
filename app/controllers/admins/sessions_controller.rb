class Admins::SessionsController < Devise::SessionsController

include AdminsHelper

def create
  resource = warden.authenticate!(auth_options)
  set_flash_message(:notice, :signed_in) if is_flashing_format?
  sign_in(resource_name, resource)
  yield resource if block_given?
  respond_with resource, location: after_sign_in_path_for(resource)
end


protected
  def after_sign_in_path_for(admin)
    resource_path(admin.id)
  end

end
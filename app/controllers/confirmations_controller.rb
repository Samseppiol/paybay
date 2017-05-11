class ConfirmationsController < Devise::ConfirmationsController
  private
  def after_confirmation_path_for(resource_name, resource)
    flash[:notice] = "Thank you for confirming your email"
      root_path
  end
end

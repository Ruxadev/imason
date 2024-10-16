class Users::RegistrationsController < Devise::RegistrationsController
  def create
    Rails.logger.info(params.inspect)
    build_resource(sign_up_params)
    resource.plan = params[:user][:plan]

    if resource.save
      resource.update(payment_status: 'pending')
      sign_in resource
      redirect_to new_payment_path
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :plan)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:plan])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation])
  end

  before_action :configure_permitted_parameters
end

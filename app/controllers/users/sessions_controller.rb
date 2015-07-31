class Users::SessionsController < Devise::SessionsController
before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    p "@"*99
    super
  end

  # POST /resource/sign_in
  def create
    p "$"*99
    p session
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.for(:sign_in) << :attribute
  end
end

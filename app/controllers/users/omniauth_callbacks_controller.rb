class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable
  def github
    @user = User.from_github(request.env["omniauth.auth"])
    if @user.persisted?
      remember_me(@user)
      sign_in_and_redirect @user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "GitHub") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  # GET|POST /users/auth/twitter
  def passthru
    super
  end

  # GET|POST /users/auth/failure/callback
  def failure
    super
  end

  protected
    # The path used when omniauth fails
    def after_omniauth_failure_path_for(scope)
      '/'
    end
end

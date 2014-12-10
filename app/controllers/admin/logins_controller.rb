class Admin::LoginsController < Admin::BaseController
  layout 'logins'
  include LoginsHelper

  skip_before_action :require_login

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to admin_products_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
  	log_out
    redirect_to root_url
  end

end

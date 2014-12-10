class SubscriptionsController < ApplicationController
  skip_before_action :require_login

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      redirect_to new_subscription_path,
        notice: 'Subscription was successfully created.'

        SubMailer.welcome(@subscription).deliver
        
    else
      redirect_to new_subscription_path,
      alert: 'Please enter a valid email address.'
    end
  end



  private
  def subscription_params
    params.require(:subscription).permit(:email)
  end
end

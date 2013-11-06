class SessionsController < ApplicationController
  def create
    user = User.find_by_email( params[:session][:email].downcase)
    #render 'new'
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
=begin
  def destroy
    sign_out
    redirect_to root_url
  end
=end
end

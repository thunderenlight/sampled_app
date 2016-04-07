class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    p params[:session][:email]
    if user || user.authenticate(params[:session][:password])
      puts "kbeat"
      log_in(user)
      redirect_to user, :notice => "Logged in as #{current_user.name}"
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  	log_out
  	redirect_to root_path, notice: "Logged out"
  end
end

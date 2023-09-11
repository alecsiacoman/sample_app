class SessionsController < ApplicationController
  def new
  end

  def create
    #this line "pulls" the user with the corresponding email out of the database 
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      #Log the user in and redirect to the user's show page
      log_in user
      redirect_to user #user_url(user)
    else
      #Create an error message
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
  
end

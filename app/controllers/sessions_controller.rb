class SessionsController < ApplicationController

  skip_before_filter :require_login
  def new
  end

  def create
    user = Student.find_by(first_name: params[:session][:first_name].downcase)
    if user
      # Log the user in and redirect to the user's show page.
      session[:first_name] = user.first_name 
      session[:last_name] = user.last_name
      redirect_to students_path
    else
      url = "http://localhost:3000/login"
      redirect_to url
      # Create an error message.
      # redirect_to students_path
  end

  def destroy
  end
end
end

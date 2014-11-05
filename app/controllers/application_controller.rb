class ApplicationController < ActionController::Base

# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception
before_filter :require_login


   def current_student
      user_first = Student.find_by(first_name: session[:first_name])
      if user_first
        return user_first
      else
        return nil
       end
    end



 def require_login
    unless current_student
      url = "http://localhost:3000/login"
      redirect_to url
    end #unless
  end#def


end #class

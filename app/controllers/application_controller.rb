class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  DBC::token = "c013ce8202caae376838c037c9f60857"

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end
  helper_method :current_user



  def buildHtml(location)
      @user_string = ''
      @location_string = "<h3>#{location.street_address}</h3>"
    location.users.each do |user|
       @user_string << "
       <img src='#{user.gravatar}'>
       <p>#{user.name}</p>
       <p>#{user.cohort_name}</p>"
    end
    full_string = @location_string + @user_string
    full_string
  end

end

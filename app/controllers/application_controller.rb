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
      @location_string =
       "<div class='info'>
       <div class='location-header'>
        <h3>Spesman's Love Shack</h3>
        <h4>#{location.street_address}</h4>
        </div>
       <ul>"
    location.users.each do |user|
       @user_string << "<li>
       <img src='#{user.gravatar}'>
       <p class='name'>#{user.name}:</p>
       <p>#{user.cohort_name.gsub(/\s.+/, '')}</p>
       <p>#{user.email}</p>

       </li>"
    end
    full_string = @location_string + @user_string
    full_string << "</ul></div>"
    full_string
  end

end

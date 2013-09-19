class SessionsController < ApplicationController

  def index

  end

  def new

  end

  def create
    user_attributes = request.env['omniauth.auth']
    session[:user_attributes] = user_attributes
    redirect_to '/map'
  end



end

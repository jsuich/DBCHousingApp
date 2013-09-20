class SessionsController < ApplicationController

  def index

  end

  def new

  end

  def create
    user_auth_attributes = request.env['omniauth.auth'].info
    session[:user_attributes] = user_auth_attributes
    user_full = DBC::User.find(session[:user_attributes][:id])
    cohort_full = DBC::Cohort.find(user_full.cohort_id)
    boot = User.find_or_create_by(email: session[:user_attributes].email)
    boot.update_attributes(name: session[:user_attributes].name, cohort_name: cohort_full.name, gravatar: session[:user_attributes].gravatar, cohort_id: user_full.cohort_id)
    session[:user_id] = boot.id
    redirect_to '/map'
  end

  def destroy
    session.clear

    redirect_to '/login'
  end



end

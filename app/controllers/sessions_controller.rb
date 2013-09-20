class SessionsController < ApplicationController

  def index

  end

  def new
    redirect_to '/auth/dbc'

  end

  def create
    user_auth_attributes = request.env['omniauth.auth'].info
    session[:user_attributes] = user_auth_attributes
    user_full = DBC::User.find(session[:user_attributes][:id])
    cohort_full = DBC::Cohort.find(user_full.cohort_id)
    boot = User.find_or_create_by(email: session[:user_attributes].email)
    boot.update_attributes(name: session[:user_attributes].name, cohort_name: cohort_full.name, cohort_id: user_full.cohort_id)

    redirect_to '/map'
  end



end

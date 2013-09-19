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
    User.create(name: session[:user_attributes][:name],
         cohort_name: cohort_full.name,
           cohort_id: user_full.cohort_id,
               email: session[:user_attributes][:email])



    #redirect_to '/map'
  end



end

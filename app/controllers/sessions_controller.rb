class SessionsController < ApplicationController

  def index

  end

  def new

  end

  def create
    p params

    redirect_to '/map'
  end



end

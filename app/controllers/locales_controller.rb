class LocalesController < ApplicationController
  
  def create
    session[:locale] = params[:locale]
    redirect_to root_path
  end
  
end
class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :home]
  before_action :require_user, only: [:home]
  
  def index
    
  end
  
  def home
    
  end
  
end
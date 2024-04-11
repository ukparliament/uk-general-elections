class ApplicationController < ActionController::Base
  
  before_action do
    expires_in 3.minutes, :public => true
  end
end

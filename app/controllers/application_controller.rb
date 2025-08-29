class ApplicationController < ActionController::Base
  
  include LibraryDesign::Crumbs

  $SITE_TITLE = 'UK General Elections Results 1832 - 2019'
  
  before_action do
    expires_in 3.minutes, :public => true
  end
end

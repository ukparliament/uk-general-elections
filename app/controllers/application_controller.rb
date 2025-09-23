class ApplicationController < ActionController::Base
  
  include LibraryDesign::Crumbs

  $SITE_TITLE = 'UK General Elections Results 1832 - 2019'
  
  $TOGGLE_PORTCULLIS = ENV.fetch( "TOGGLE_PORTCULLIS", 'off' )
  
  before_action do
    expires_in 3.minutes, :public => true
  end
end

class MetaController < ApplicationController
  
  def index
    @title = 'Meta'
  end
  
  def schema
    @title = 'Database schema'
  end
  
  def cookies
    @title = 'Cookies'
  end
end

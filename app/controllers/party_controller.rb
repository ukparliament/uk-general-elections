class PartyController < ApplicationController
  
  def index
    @parties = Party.all.order( 'name' )
    @page_title = 'Parties'
  end
  
  def show
    party = params[:party]
    @party = Party.find( party )
    @title = @party.name
  end
end

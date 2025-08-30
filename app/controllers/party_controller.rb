class PartyController < ApplicationController
  
  def index
    @parties = Party.all.order( 'name' )
    @page_title = 'Parties'
    @description = 'Parties.'
    @section = 'parties'
    @crumb << { label: @page_title, url: nil }
  end
  
  def show
    party = params[:party]
    @party = Party.find( party )
    @page_title = @party.name
    @description = "#{@party.name}."
    @section = 'parties'
    @crumb << { label: 'Parties', url: party_list_url }
    @crumb << { label: @page_title, url: nil }
  end
end

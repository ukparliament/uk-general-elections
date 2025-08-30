class GeneralElectionController < ApplicationController
  
  def index
    @general_elections = GeneralElection.find_by_sql(
      "
        SELECT ge.*, y.year
        FROM general_elections ge, years y
        WHERE ge.year_id = y.id
        ORDER BY y.year, ge.id
      "
    )
    
    @page_title = 'General elections'
    @description = 'UK General elections.'
    @section = 'general-elections'
    @crumb << { label: @page_title, url: nil }
  end
  
  def show
    general_election = params[:general_election]
    @general_election = GeneralElection.find( general_election )
    
    @page_title = @general_election.name
    @description = "#{@general_election.name}."
    @section = 'general-elections'
    @subsection = 'elections'
    @crumb << { label: 'General elections', url: general_election_list_url }
    @crumb << { label: @page_title, url: nil }
    
    render :template => 'general_election_election/index'
  end
end

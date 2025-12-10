class GeneralElectionElectionController < ApplicationController

  def index
    general_election = params[:general_election]
    @general_election = GeneralElection.find( general_election )
    
    @page_title = "#{@general_election.name} - elections"
    @description = "Elections taking place as part of the #{@general_election.name}."
    @canonical_url = general_election_show_url
    @section = 'general-elections'
    @subsection = 'elections'
    @crumb << { label: 'General elections', url: general_election_list_url }
    @crumb << { label: @general_election.name, url: general_election_show_url }
    @crumb << { label: 'Elections', url: nil }
  end
end

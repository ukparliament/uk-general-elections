class GeneralElectionController < ApplicationController
  
  def index
    @title = 'General elections'
    @general_elections = GeneralElection.find_by_sql(
      "
        SELECT ge.*, y.year
        FROM general_elections ge, years y
        WHERE ge.year_id = y.id
        ORDER BY y.year, ge.id
      "
    )
  end
  
  def show
    general_election = params[:general_election]
    @general_election = GeneralElection.find( general_election )
    @title = @general_election.name
  end
end

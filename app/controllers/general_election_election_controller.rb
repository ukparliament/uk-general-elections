class GeneralElectionElectionController < ApplicationController

  def index
    general_election = params[:general_election]
    @general_election = GeneralElection.find( general_election )
    @title = @general_election.name + ' - Elections'
  end
end

class GeneralElectionPartyController < ApplicationController

  def index
    general_election = params[:general_election]
    @general_election = GeneralElection.find( general_election )
    @title = @general_election.name + ' - Parties'
    @parties = Party.find_by_sql(
      "
        SELECT p.*, count(e.id) AS election_count 
        FROM parties p, candidacies c, elections e
        WHERE c.party_id = p.id
        AND c.election_id = e.id
        AND e.general_election_id = #{@general_election.id}
        GROUP BY p.id
        ORDER BY p.name
      "
    )
  end
  
  def show
    general_election = params[:general_election]
    @general_election = GeneralElection.find( general_election )
    party = params[:party]
    @party = Party.find( party )
    @elections = Election.find_by_sql(
      "
        SELECT e.*, con.name AS constituency_name
        FROM elections e, candidacies c, constituencies con
        WHERE e.general_election_id = #{@general_election.id}
        AND e.id = c.election_id
        AND c.party_id = #{@party.id}
        AND e.constituency_id = con.id
      "
    )
    @title = "#{@general_election.name} - Parties - #{@party.name}"
  end
end

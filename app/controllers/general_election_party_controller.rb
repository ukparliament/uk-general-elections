class GeneralElectionPartyController < ApplicationController

  def index
    general_election = params[:general_election]
    @general_election = GeneralElection.find( general_election )
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
    
    @page_title = "#{@general_election.name} - Parties"
    @description = "Political parties standing candidates in the #{@general_election.name}."
    @section = 'general-elections'
    @subsection = 'parties'
    @crumb << { label: 'General elections', url: general_election_list_url }
    @crumb << { label: @general_election.name, url: general_election_show_url }
    @crumb << { label: 'Parties', url: nil }
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
    
    @page_title = "#{@general_election.name} - Elections contested by #{@party.name}"
    @description = "Elections contested by #{@party.name} in the #{@general_election.name}."
    @section = 'general-elections'
    @subsection = 'parties'
    @crumb << { label: 'General elections', url: general_election_list_url }
    @crumb << { label: @general_election.name, url: general_election_show_url }
    @crumb << { label: 'Parties', url: general_election_party_list_url }
    @crumb << { label: @party.name, url: nil }
    
    
    
    
    @title = "#{@general_election.name} - Parties - #{@party.name}"
  end
end

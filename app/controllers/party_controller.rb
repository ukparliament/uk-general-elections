class PartyController < ApplicationController
  
  def index
    @parties = Party.all.order( 'name' )
    @title = 'Parties'
  end
  
  def show
    party = params[:party]
    @party = Party.find( party )
    @elections = Election.find_by_sql(
      "
        SELECT e.*, y.year AS year, ge.name AS general_election_name, con.name AS constituency_name
        FROM years y, general_elections ge, elections e, candidacies c, constituencies con
        WHERE y.id = ge.year_id
        AND ge.id = e.general_election_id
        AND e.id = c.election_id
        AND c.party_id = #{@party.id}
        AND e.constituency_id = con.id
        ORDER BY y.year, ge.id, con.name
      "
    )
    @title = @party.name
  end
end

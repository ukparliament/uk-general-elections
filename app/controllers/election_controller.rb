class ElectionController < ApplicationController
  
  def index
    @title = 'Constituency elections'
    @elections = Election.find_by_sql(
      "
        SELECT e.*, y.year AS year, ge.name AS general_election_name, c.name AS constituency_name
        FROM elections e, constituencies c, general_elections ge, years y
        WHERE e.constituency_id = c.id
        AND e.general_election_id = ge.id
        AND ge.year_id = y.id
        ORDER BY y.year, ge.name, c.name;
      "
    )
  end
  
  def show
    election = params[:election]
    @election = Election.find_by_sql(
      "
        SELECT e.*, y.year AS year, y.id AS year_id, ge.name AS general_election_name, c.name AS constituency_name
        FROM elections e, constituencies c, general_elections ge, years y
        WHERE e.id = #{election}
        AND e.constituency_id = c.id
        AND e.general_election_id = ge.id
        AND ge.year_id = y.id
        ORDER BY y.year, ge.name, c.name;
      "
    ).first
    @title = "#{@election.year} - #{@election.general_election_name} - #{@election.constituency_name}"
  end
end

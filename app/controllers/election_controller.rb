class ElectionController < ApplicationController
  
  def index
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
    @page_title = 'Elections'
    @description = 'Elections.'
    @crumb << {label: @page_title, url: nil}
  end
  
  def show
    election_id = params[:election]
    @election = Election.find_by_sql([
      "
        SELECT e.*, y.year AS year, y.id AS year_id, ge.name AS general_election_name, c.name AS constituency_name
        FROM elections e, constituencies c, general_elections ge, years y
        WHERE e.id = ?
        AND e.constituency_id = c.id
        AND e.general_election_id = ge.id
        AND ge.year_id = y.id
        ORDER BY y.year, ge.name, c.name;
      ", election_id
    ]).first

    @page_title = "#{@election.general_election_name} - #{@election.constituency_name}"
    @description = "Election in #{@election.constituency_name} held as part of the #{@election.general_election_name}."
    @section = 'general-elections'
    @crumb << {label: 'General elections', url: general_election_list_url}
    @crumb << {label: @election.general_election_name, url: general_election_show_url( :general_election => @election.general_election )}
    @crumb << {label: @election.constituency_name, url: nil}
    
  end
end

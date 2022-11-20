class YearController < ApplicationController
  
  def index
    @title = 'Years'
    @years = Year.find_by_sql(
      "
        SELECT y.*, COUNT(ge.id) as general_election_count
        FROM years y, general_elections ge
        WHERE y.id = ge.year_id
        GROUP BY y.id
        ORDER BY y.year
      "
    )
  end
  
  def show
    year = params[:year]
    @year = Year.find( year )
    @title = @year.year
  end
end

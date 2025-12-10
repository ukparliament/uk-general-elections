class YearController < ApplicationController
  
  def index
    @years = Year.find_by_sql(
      "
        SELECT y.*, COUNT(ge.id) as general_election_count
        FROM years y, general_elections ge
        WHERE y.id = ge.year_id
        GROUP BY y.id
        ORDER BY y.year
      "
    )
    
    @page_title = 'Years'
    @description = 'Years having general elections.'
    @section = 'years'
    @crumb << { label: @page_title, url: nil }
  end
  
  def show
    year = params[:year]
    @year = Year.find( year )
    
    @page_title = "General elections in #{@year.year}"
    @description = "UK general elections in #{@year.year}."
    @section = 'years'
    @crumb << { label: 'Years', url: year_list_url }
    @crumb << { label: @year.year.to_s, url: nil }
  end
end

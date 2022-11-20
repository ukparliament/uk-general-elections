class ConstituencyController < ApplicationController
  
  def index
    @title = 'Constituencies'
    @constituencies = Constituency.find_by_sql(
      "
        SELECT c.*, COUNT(e.id) as election_count
        FROM constituencies c, elections e
        WHERE c.id = e.constituency_id
        GROUP BY c.id
        ORDER BY c.name
      "
    )
  end
  
  def show
    constituency = params[:constituency]
    @constituency = Constituency.find( constituency )
    @title = @constituency.name
  end
end

class ConstituencyController < ApplicationController
  
  def index
    @constituencies = Constituency.find_by_sql(
      "
        SELECT c.*, COUNT(e.id) as election_count
        FROM constituencies c, elections e
        WHERE c.id = e.constituency_id
        GROUP BY c.id
        ORDER BY c.name
      "
    )
    @page_title = 'Constituencies'
    @description = 'Constituencies.'
    @section = 'constituencies'
    @crumb << { label: @page_title, url: nil }
  end
  
  def show
    constituency = params[:constituency]
    @constituency = Constituency.find( constituency )
    @page_title = @constituency.name
    @description = "#{@constituency.name}."
    @section = 'constituencies'
    @crumb << { label: 'Constituencies', url: constituency_list_url }
    @crumb << { label: @page_title, url: nil }
  end
end

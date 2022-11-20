class CandidateNameController < ApplicationController
  
  def index
    @title = 'Candidate names'
    @candidate_names = CandidateName.find_by_sql(
      "
        SELECT cn.*
        FROM candidate_names cn
        ORDER BY cn.name
      "
    )
  end
  
  def show
    candidate_name = params[:candidate_name]
    @candidate_name = CandidateName.find( candidate_name )
    @title = "Candidate names - #{@candidate_name.name}"
  end
end

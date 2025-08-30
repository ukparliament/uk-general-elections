class CandidateNameController < ApplicationController
  
  def index
    @candidate_names = CandidateName.find_by_sql(
      "
        SELECT cn.*
        FROM candidate_names cn
        ORDER BY cn.name
      "
    )
    @page_title = 'Candidate names'
    @description = 'Candidate names.'
    @section = 'candidates'
    @crumb << { label: @page_title, url: nil }
  end
  
  def show
    candidate_name = params[:candidate_name]
    @candidate_name = CandidateName.find( candidate_name )
    @page_title = "Candidate names - #{@candidate_name.name}"
    @description = "Candidates with the name #{@candidate_name.name}."
    @section = 'candidates'
    @crumb << {label: 'Candidate names', url: letter_list_url}
    @crumb << {label: @candidate_name.surname.surname[0,1], url: letter_show_url( :letter => @candidate_name.surname.letter )}
    @crumb << {label: @candidate_name.surname.surname, url: surname_show_url( :surname => @candidate_name.surname )}
    @crumb << {label: @candidate_name.name, url: nil}
  end
end

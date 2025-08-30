class SurnameController < ApplicationController
  
  def index
    @surnames = Surname.all.order( 'surname' )
    @page_title = 'Family names'
    @description = 'Family names.'
    @section = 'candidates'
    @crumb << {label: @page_title, url: nil}
  end
  
  def show
    surname = params[:surname]
    @surname = Surname.find( surname )
    @page_title = "Candidate names - #{@surname.surname}"
    @description = "Candidates with the family name #{@surname.surname}."
    @section = 'candidates'
    @crumb << {label: 'Candidate names', url: letter_list_url}
    @crumb << {label: @surname.surname[0,1], url: letter_show_url( :letter => @surname.letter )}
    @crumb << {label: @surname.surname, url: nil}
  end
end

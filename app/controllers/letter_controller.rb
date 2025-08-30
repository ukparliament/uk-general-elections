class LetterController < ApplicationController
  
  def index
    @letters = Letter.all.order( 'letter' )
    @page_title = 'Candidate names - A to Z'
    @description = 'Candidate names - A to Z.'
    @section = 'candidates'
    @crumb << { label: 'Candidate names', url: nil }
  end
  
  def show
    letter = params[:letter]
    @letter = Letter.find( letter )
    @page_title = "Candidate names - #{@letter.letter}"
    @descripption = "Candidate names - #{@letter.letter}."
    @section = 'candidates'
    @crumb << { label: 'Candidate names', url: letter_list_url }
    @crumb << { label: @letter.letter, url: nil }
  end
end

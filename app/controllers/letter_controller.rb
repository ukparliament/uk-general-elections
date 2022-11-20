class LetterController < ApplicationController
  
  def index
    @letters = Letter.all.order( 'letter' )
    @title = 'Surname letters'
  end
  
  def show
    letter = params[:letter]
    @letter = Letter.find( letter )
    @title = "Surname letters - #{@letter.letter}"
  end
end

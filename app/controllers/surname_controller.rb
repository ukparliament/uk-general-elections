class SurnameController < ApplicationController
  
  def index
    @title = 'Surnames'
    @surnames = Surname.all.order( 'surname' )
  end
  
  def show
    surname = params[:surname]
    @surname = Surname.find( surname )
    @title = "Surnames - #{@surname.surname}"
  end
end

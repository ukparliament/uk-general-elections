class Letter < ApplicationRecord
  
  has_many :surnames, -> { order( :surname ) }
end

# == Schema Information
#
# Table name: letters
#
#  id     :integer          not null, primary key
#  letter :string(1)        not null
#
class Letter < ApplicationRecord
  
  has_many :surnames, -> { order( :surname ) }
end

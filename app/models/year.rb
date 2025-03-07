# == Schema Information
#
# Table name: years
#
#  id   :integer          not null, primary key
#  year :integer          not null
#
class Year < ApplicationRecord
  
  has_many :general_elections
end

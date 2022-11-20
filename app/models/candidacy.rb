class Candidacy < ApplicationRecord
  
  belongs_to :election
  belongs_to :party
  belongs_to :candidate_name
end

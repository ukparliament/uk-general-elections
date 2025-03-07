# == Schema Information
#
# Table name: candidacies
#
#  id                :integer          not null, primary key
#  votes             :integer
#  candidate_name_id :integer          not null
#  election_id       :integer          not null
#  party_id          :integer          not null
#
# Foreign Keys
#
#  fk_candidate_name  (candidate_name_id => candidate_names.id)
#  fk_election        (election_id => elections.id)
#  fk_party           (party_id => parties.id)
#
class Candidacy < ApplicationRecord
  
  belongs_to :election
  belongs_to :party
  belongs_to :candidate_name
end

class Election < ApplicationRecord
  
  belongs_to :general_election
  belongs_to :constituency
  
  def candidacies
    Candidacy.find_by_sql(
    "
      SELECT c.*, p.name as party_name, cn.name as candidate_name_display
      FROM candidacies c, parties p, candidate_names as cn
      WHERE c.election_id = #{self.id}
      AND c.party_id = p.id
      AND c.candidate_name_id = cn.id
      ORDER BY c.votes DESC;
    "
    )
  end
  
  def name_with_general_election
    full_name = year.to_s
    full_name += ' - '
    full_name += general_election_name
  end
  
  def full_name
    full_name = year.to_s
    full_name += ' - '
    full_name += general_election_name
    full_name += ' - '
    full_name += constituency_name
  end
end

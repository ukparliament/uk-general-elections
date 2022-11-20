class CandidateName < ApplicationRecord
  
  belongs_to :surname
  
  def elections
    Election.find_by_sql(
      "
        SELECT e.*, y.year AS year, ge.name AS general_election_name, con.name AS constituency_name
        FROM elections e, general_elections ge, years y, constituencies con, candidacies can
        WHERE e.general_election_id = ge.id
        AND ge.year_id = y.id
        AND e.constituency_id = con.id
        AND can.election_id = e.id
        AND can.candidate_name_id = #{self.id}
      "
    )
  end
end

class Party < ApplicationRecord
  
  def general_elections
    GeneralElection.find_by_sql(
      "
        SELECT ge.*
        FROM years y, general_elections ge, elections e, candidacies c
        WHERE ge.year_id = y.id
        AND ge.id = e.general_election_id
        AND e.id = c.election_id
        AND c.party_id = #{self.id}
        GROUP BY y.id, ge.id
        ORDER BY y.year, ge.id
      "
    )
  end
end

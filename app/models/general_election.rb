class GeneralElection < ApplicationRecord
  
  belongs_to :year
  
  def elections
    Election.find_by_sql(
      "
        SELECT e.*, c.name AS constituency_name
        FROM elections e, constituencies c
        WHERE e.constituency_id = c.id
        AND e.general_election_id = #{self.id}
        ORDER BY c.name;
      "
    )
  end
  
  def voting_dates
    voting_dates = ''
    if self.voting_start_on == self.voting_end_on
      voting_dates = self.voting_start_on.strftime( '%d-%m-%Y')
    else
      voting_dates = "#{self.voting_start_on.strftime( '%d-%m-%Y')} - #{self.voting_end_on.strftime( '%d-%m-%Y')}"
    end
    voting_dates
  end
end

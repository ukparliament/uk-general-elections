# == Schema Information
#
# Table name: general_elections
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  voting_end_on   :date             not null
#  voting_start_on :date             not null
#  year_id         :integer          not null
#
# Foreign Keys
#
#  fk_year  (year_id => years.id)
#
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
      voting_dates = self.voting_start_on.strftime( '%A, %-d %B %Y')
    else
      voting_dates = "#{self.voting_start_on.strftime( '%A, %-d %B %Y')} to #{self.voting_end_on.strftime( '%A, %-d %B %Y')}"
    end
    voting_dates
  end
end

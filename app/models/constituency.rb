# == Schema Information
#
# Table name: constituencies
#
#  id   :integer          not null, primary key
#  name :string(255)      not null
#
class Constituency < ApplicationRecord
  
  def elections
    Election.find_by_sql(
      "
        SELECT e.*, ge.name AS general_election_name, y.year AS year
        FROM elections e, general_elections ge, years y
        WHERE e.constituency_id = #{self.id}
        AND e.general_election_id = ge.id
        AND ge.year_id = y.id
        
      "
    )
  end
end

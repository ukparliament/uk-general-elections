class Surname < ApplicationRecord
  
  belongs_to :letter
  
  def candidate_names
    CandidateName.find_by_sql( 
      "
        SELECT cn.*
        FROM candidate_names cn
        WHERE cn.surname_id = #{self.id}
        ORDER BY cn.name
      "
    )
  end
end

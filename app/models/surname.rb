# == Schema Information
#
# Table name: surnames
#
#  id        :integer          not null, primary key
#  surname   :string(255)      not null
#  letter_id :integer          not null
#
# Foreign Keys
#
#  fk_letter  (letter_id => letters.id)
#
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

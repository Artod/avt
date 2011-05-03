class City < ActiveRecord::Base
  has_one :cost, foreign_key: :origin_id
  has_one :cost, foreign_key: :destination_id
   
  def self.find_origin_id (depart_city)
    select('id')
    .where('name like ?', "%#{depart_city}%")
    .limit(1)
    .first
    .id
  end
end

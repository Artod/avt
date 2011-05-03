class Cost < ActiveRecord::Base
  belongs_to :origin, class_name: 'City', foreign_key: :id  #foreign_key: :origin_id
  belongs_to :destination, class_name: 'City', foreign_key: :id
  
  def self.find_minimal_prices(origin_id, params)
    begin
      depart_date = Date.new(params[:depart_date]['(1i)'].to_i, params[:depart_date]['(2i)'].to_i, params[:depart_date]['(3i)'].to_i)
    rescue
      return {}
    end

    duration = (params[:duration].nil? ? 0 : params[:duration].to_i)
      
    includes(:destination)
    .where('origin_id = ? AND depart_date = ? AND return_date '+(duration != 0 ? ' = ' : ' >= ')+'?',
      origin_id,
      depart_date,
      (duration != 0 ? depart_date + params[:duration].to_i.week : depart_date)
    )
    .order('costs.value asc')
    .paginate(page: params[:page], per_page: 20)
  end
end
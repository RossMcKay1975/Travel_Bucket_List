require_relative("../db/sql_runner")

class Visit

attr_reader :id
attr_accessor :country_id, :city_id, :rating, :done

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @country_id = options['country_id'].to_i
    @city_id = options['city_id'].to_i
    @rating = options['rating'].to_i
    @done = options['done'].to_i
  end


end

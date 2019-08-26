require_relative("../db/sql_runner")

class Adventure

attr_reader :id
attr_accessor :country_id, :city_id, :rating, :done

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @country_id = options['country_id'].to_i
    @city_id = options['city_id'].to_i
    @rating = options['rating'].to_i
    @done = options['done'].to_i
  end


  def save()
    sql = "INSERT INTO adventures (city_id, visited, rating) VALUES ($1, $2, $3) RETURNING id"
    values = [@city_id, @visited, @rating]
    adventure = SqlRunner.run(sql, values)[0];
    @id = adventure['id'].to_i
  end

end

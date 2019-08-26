require_relative("../db/sql_runner")


class City
  attr_reader :id
  attr_accessor :city, :country_id

 def initialize(options)
   @id = options['id'].to_i if options['id']
   @city = options['city']
   @country_id = options['country_id'].to_i
 end

 def save()
   sql = "INSERT INTO cities (city, country_id) VALUES ($1, $2) RETURNING id"
   values = [@city, @country_id]
   city = SqlRunner.run(sql, values)[0];
   @id = city['id'].to_i
 end

end

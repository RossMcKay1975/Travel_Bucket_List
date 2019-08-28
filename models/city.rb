require_relative("../db/sql_runner")


class City
  attr_reader :id
  attr_accessor :name, :country_id

 def initialize(options)
   @id = options['id'].to_i if options['id']
   @name = options['name']
   @country_id = options['country_id'].to_i
 end

 def self.find(id)
   sql = "SELECT * FROM cities WHERE id = $1"
   values = [id]
   results = SqlRunner.run(sql, values)
   return City.new(results.first)
 end

 def save()
   sql = "INSERT INTO cities (name, country_id) VALUES ($1, $2) RETURNING id"
   values = [@name, @country_id]
   name = SqlRunner.run(sql, values)[0];
   @id = name['id'].to_i
 end

 def delete()
   sql = "DELETE * FROM cities where id = $1"
   values =[@id]
   SqlRunner.run(sql, values)
 end


  def update()
       sql = "UPDATE cities SET
      (name, city_id) = ($1, $2) WHERE id = $2"
      values = [@name, @id]
     SqlRunner.run(sql, values)
  end

 def self.all()
   sql = "SELECT * FROM cities"
   city_data = SqlRunner.run(sql)
   return City.map_items(city_data)
 end

 def self.delete_all()
   sql = "DELETE FROM cities"
   SqlRunner.run(sql)
 end

 def self.map_items(data)
   result = data.map{|city_name| City.new(city_name)}
   return result
 end

 def country
   country=Country.find(@country_id)
   return country
 end

end

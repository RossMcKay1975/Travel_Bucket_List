require_relative("../db/sql_runner")

class Country

attr_reader :id
attr_accessor :country

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @country = options['country']
  end

  def save()
    sql = "INSERT INTO countries (country) VALUES ($1) RETURNING id"
    values = [@country]
    country = SqlRunner.run(sql, values)
    @id = country.first()['id'].to_i
  end

  def delete()
    sql = "DELETE * FROM countries where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM countries"
    country_data = SqlRunner.run(sql)
    return Country.map_items(movie_data)
  end

  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end


  def self.map_items(data)
    result = data.map{|country| Country.new(country)}
    return result
  end

end

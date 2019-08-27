require_relative("../db/sql_runner")

class Country

attr_reader :id
attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO countries (name) VALUES ($1) RETURNING id"
    values = [@name]
    name = SqlRunner.run(sql, values)
    @id = name.first()['id'].to_i
  end
  #
  def self.find(id)
    sql = "SELECT * FROM countries where id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    # binding.pry
    return Country.new(results.first)
  end

    def update()
      sql = "UPDATE countries
      SET
      (name) = ($1)
      WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

  def delete()
    sql = "DELETE * FROM countries where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM countries"
    country_data = SqlRunner.run(sql)
    return Country.map_items(country_data)
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

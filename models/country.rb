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

end

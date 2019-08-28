require_relative("../db/sql_runner")

class Bucket_list

attr_reader :id, :country_id, :city_id
attr_accessor :rating, :done

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @city_id = options['city_id'].to_i
    @rating = options['rating'].to_i
    @done = options['done'].to_i
  end

  def save()
    sql = "INSERT INTO bucket_list (city_id, visited, rating) VALUES ($1, $2, $3) RETURNING id"
    values = [@city_id, @visited, @rating]
    bucket_list = SqlRunner.run(sql, values)[0];
    @id = bucket_list['id'].to_i
  end

  def city
    city=City.find(@city_id)
    return city
  end


  def self.find(id)
    sql = "SELECT * FROM bucket_list WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Bucket_list.new(results.first)
  end


  def update()
    sql = "UPDATE bucket_list SET
    (city_id, visited, rating) =
    ($1, $2, $3)
    WHERE id = $4"
    values = [@city_id, @visited, @rating, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "Delete FROM bucket_list WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM bucket_list"
    data = SqlRunner.run (sql)
    return data.map{|bucket_list| Bucket_list.new(bucket_list)}
  end

  def self.delete_all()
    sql = "DELETE FROM bucket_list"
    SqlRunner.run(sql)
  end

end

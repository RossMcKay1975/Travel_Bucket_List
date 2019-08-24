require_relative("../db/sql_runner")

class City
  attr_reader :id
  attr_accessor :city

 def initialize(options)
   @id = options['id'].to_i if options['id']
   @city = options['city']
   @country_id = options['country'].to_i
 end



end

require_relative("../db/sql_runner")

class Country

attr_reader :id
attr_accessor :country

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @country = options['country']
  end


end

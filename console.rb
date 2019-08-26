require_relative('models/adventures')
require_relative('models/country')
require_relative('models/city')

require('pry')




country1 = Country.new({'country' => 'Croatia'})
country1.save

city1 = City.new({'city' => 'Dubrovnik', 'country_id' => country1.id})
city1.save
#
#
#
#
#
# binding.pry
# nil

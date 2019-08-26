require_relative('models/adventure')
require_relative('models/country')
require_relative('models/city')

require('pry')

Adventure.delete_all()
City.delete_all()
Country.delete_all()

country1 = Country.new({'country' => 'Croatia'})
country1.save

city1 = City.new({'city' => 'Dubrovnik', 'country_id' => country1.id})
city1.save


adventure1 = Adventure.new({'city_id' => city1.id, 'visited' => 't', 'rating' => 5})
adventure1.save

#
#

binding.pry
nil

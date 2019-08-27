require_relative('models/bucket_list')
require_relative('models/country')
require_relative('models/city')

require('pry')

Bucket_list.delete_all()
City.delete_all()
Country.delete_all()

country1 = Country.new({'name' => 'Croatia'})
country2 = Country.new({'name' => 'China'}
country1.save
country2.save

city1 = City.new({'name' => 'Dubrovnik', 'country_id' => country1.id})
city2 = City.new({'name' => 'Beijing', 'country_id' => country2.id})
city1.save
city2.save


bucket_list1 = Bucket_list.new({'city_id' => city1.id, 'visited' => 't', 'rating' => 5})
bucket_list2 = Bucket_list.new({'city_id' => city2.id, 'visited' =>} 't', 'rating' => 4})
bucket_list1.save
bucket_list2.save

#
#

binding.pry
nil

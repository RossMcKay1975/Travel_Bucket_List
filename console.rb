require_relative('models/bucket_list')
require_relative('models/country')
require_relative('models/city')

require('pry')

Bucket_list.delete_all()
City.delete_all()
Country.delete_all()

country1 = Country.new({'name' => 'Croatia'})
country2 = Country.new({'name' => 'China'})
country3 = Country.new({'name' => 'Italy'})
country4 = Country.new({'name' => 'France'})
country5 = Country.new({'name' => 'America'})
country6 = Country.new({'name' => 'Mexico'})
country7 = Country.new({'name' => 'New Zealand'})
country8 = Country.new({'name' => 'Australia'})
country9 = Country.new({'name' => 'Indonesia'})
country10 = Country.new({'name' => 'Iceland'})
country11 = Country.new({'name' => 'Spain'})
country1.save
country2.save
country3.save
country4.save
country5.save
country6.save
country7.save
country8.save
country9.save
country10.save
country11.save


city1 = City.new({'name' => 'Dubrovnik', 'country_id' => country1.id})
city2 = City.new({'name' => 'Beijing', 'country_id' => country2.id})
city1.save
city2.save


bucket_list1 = Bucket_list.new({'city_id' => city1.id, 'visited' => 't', 'rating' => 5})
bucket_list2 = Bucket_list.new({'city_id' => city2.id, 'visited' => 't', 'rating' => 4})
bucket_list1.save
bucket_list2.save

#
#

binding.pry
nil

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/bucket_list_items_controller')
require_relative('controllers/countries_controller')
require_relative('controllers/cities_controller')

get '/' do
  erb( :index )
end

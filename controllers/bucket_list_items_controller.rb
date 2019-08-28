require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/bucket_list')
require_relative('../models/city')
require_relative('../models/country')
# require('pry')
also_reload('./models/*')

get '/bucket_list' do
  @bucket_list_items = Bucket_list.all
  # binding.pry
  erb( :'bucket_list_items/index')
end

get '/bucket_list/new' do
  @cities = City.all
  erb( :'bucket_list_items/new' )
end

post '/bucket_list' do
  Bucket_list.new(params).save
  redirect to '/bucket_list'
end
#
# get '/city/:id' do
#   @city = City.find(params['id'])
#   erb(:show)
# end
#
# get '/city/:id/edit' do
#   @country = City.all
#   @city = City.find(params['id'])
#   erb(:edit)
# end
#
# post '/city/:id' do
#   city = City.new(params)
#   city.update
#   redirect to "/cities/#{params['id']}"
# end
#
# post '/cities/:id/delete' do
#   student = City.find(params['id'])
#   student.delete
#   redirect to '/Cities'
# end

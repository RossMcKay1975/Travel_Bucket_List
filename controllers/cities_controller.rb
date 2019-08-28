require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/bucket_list')
require_relative('../models/city')
require_relative('../models/country')
require('pry')
also_reload('./models/*')


get '/city' do
  @cities = City.all
  erb(:'cities/index')
end

get '/city/new' do
  @countries = Country.all
  erb(:'cities/new')
end
#
post '/city' do
  City.new(params).save
  redirect to '/city'
end


get '/city/:id' do
  @city = City.find(params['id'])
  erb(:show)
end

get '/cities/:id/edit' do
  @cities = City.all
  @Countries = Country.find(params['id'])
  erb(:edit)
end

post '/city/:id' do
  city = City.new(params)
  city.update
  redirect to "/cities/#{params['id']}"
end

post '/city/:id/delete' do
  city = City.find(params['id'])
  student.delete
  redirect to '/city'
end

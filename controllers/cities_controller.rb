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
  redirect to '/bucket_list'
end

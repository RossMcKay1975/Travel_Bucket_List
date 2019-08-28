require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/bucket_list')
require_relative('../models/city')
require_relative('../models/country')
require('pry')
also_reload('./models/*')

get '/country' do
  @countries = Country.all
  # binding.pry
  erb(:'countries/index')
end

get '/country/new' do
  country = Country.all
  erb(:'countries/new')
end
#
post '/country' do
  Country.new(params).save
  redirect to '/bucket_list'
end

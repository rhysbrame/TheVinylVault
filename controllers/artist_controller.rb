require_relative( '../models/artist' )

get '/artists/' do
  redirect '/artists'
end

get '/artists' do
  @artists = Artist.all()
  erb(:'artists/index')
end
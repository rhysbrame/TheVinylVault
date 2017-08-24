require_relative( '../models/genre' )

get '/genres/' do
  redirect '/genres'
end

get '/genres' do
  @genres = Genre.all()
  erb(:'genres/index')
end
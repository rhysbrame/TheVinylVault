require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/record_controller')
require_relative('./controllers/genre_controller')
require_relative('./controllers/artist_controller')

get '/' do
  erb(:index)
end

get '' do
  redirect '/'
end
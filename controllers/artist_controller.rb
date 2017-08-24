require_relative( '../models/artist' )

get '/artists/' do
  redirect '/artists'
end

get '/artists' do
  @artists = Artist.all()
  erb(:'artists/index')
end

get '/artists/new' do
  erb ( :'artists/new')
end

post '/artists' do
  @artist = Artist.new(params)
  @artist.save
  redirect '/artists'
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb ( :'artists/show' )
end

get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb ( :'artists/edit')
end

post '/artists/:id' do
  @artist = Artist.new(params)
  @artist.update
  erb ( :'artists/show' )
end

post '/artists/:id/delete' do
  @artist = Artist.find(params[:id])
  @artist.delete()
  redirect '/artists'
end
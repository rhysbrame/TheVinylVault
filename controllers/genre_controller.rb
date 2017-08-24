require_relative( '../models/genre' )

get '/genres/' do
  redirect '/genres'
end

get '/genres' do
  @genres = Genre.all()
  erb(:'genres/index')
end

get '/genres/new' do
  erb ( :'genres/new')
end

post '/genres' do
  @genre = Genre.new(params)
  @genre.save
  redirect '/genres'
end

get '/genres/:id' do
  @genre = Genre.find(params[:id])
  erb ( :'genres/show' )
end

get '/genres/:id/edit' do
  @genre = Genre.find(params[:id])
  erb ( :'genres/edit')
end

post '/genres/:id' do
  @genre = Genre.new(params)
  @genre.update
  erb ( :'genres/show' )
end

post '/genres/:id/delete' do
  @genre = Genre.find(params[:id])
  @genre.delete()
  redirect '/genre'
end
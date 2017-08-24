require_relative( '../models/record' )

get '/records/' do
  redirect '/records'
end

get '/records' do
  @records = Record.all()
  erb(:'records/index')
end

get '/records/new' do
  @artists = Artist.all()
  @genres = Genre.all()
  erb(:'records/new')
end

post '/records' do
  @record = Record.new(params)
  @record.save
  redirect '/records'
end

get '/records/:id' do
  @record = Record.find(params[:id])
  erb( :'records/show' )
end

get '/records/:id/edit' do
  @record = Record.find(params[:id])
  erb ( :'records/edit' )
end

post '/records/:id' do
  @record = Record.new(params)
  @record.update()
  erb ( :'records/show' )
end

post '/records/:id/delete' do
  @record = Record.find(params[:id])
  @record.delete()
  redirect '/records'
end
require_relative( '../models/record' )

get '/records' do
  @records = Record.all()
  erb(:'records/index')
end
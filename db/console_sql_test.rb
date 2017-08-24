require_relative( '../models/record' )
require_relative( '../models/artist' )
require_relative( '../models/genre' )

Record.delete_all()
Artist.delete_all()
Genre.delete_all()

genre1 = Genre.new({
  'genre_type' => 'Rock'
})
genre1.save()

artist1 = Artist.new({ 
  'artist_name' => 'Oasis'
})
artist1.save()

record1 = Record.new({
  'record_title' => 'Definately Maybe',
  'artist_id' => artist1.id,
  'genre_id' => genre1.id
})
record1.save()

record2 = Record.new({
  'record_title' => 'Whats the story, morning glory',
  'artist_id' => artist1.id,
  'genre_id' => genre1.id
})
record2.save()

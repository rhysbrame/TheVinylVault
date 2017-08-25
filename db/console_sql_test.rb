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

genre2 = Genre.new({
  'genre_type' => 'Acoustic'
})
genre2.save()

genre3 = Genre.new({
  'genre_type' => 'Metal'
})
genre3.save()

genre4 = Genre.new({
  'genre_type' => 'Pop'
})
genre4.save()

genre5 = Genre.new({
  'genre_type' => 'Grunge'
})
genre5.save()

genre6 = Genre.new({
  'genre_type' => 'Electronic'
})
genre6.save()

artist1 = Artist.new({ 
  'artist_name' => 'Oasis'
})
artist1.save()

artist2 = Artist.new({ 
  'artist_name' => 'Nirvana'
})
artist2.save()

artist3 = Artist.new({ 
  'artist_name' => 'Britney Spears'
})
artist3.save()

artist4 = Artist.new({ 
  'artist_name' => 'Metallica'
})
artist4.save()

artist5 = Artist.new({ 
  'artist_name' => 'Neil Young'
})
artist5.save()

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

record3 = Record.new({
  'record_title' => 'Bleach',
  'artist_id' => artist2.id,
  'genre_id' => genre5.id
})
record3.save()

record4 = Record.new({
  'record_title' => 'Nevermind',
  'artist_id' => artist2.id,
  'genre_id' => genre5.id
})
record4.save()

record5 = Record.new({
  'record_title' => 'Harvest',
  'artist_id' => artist5.id,
  'genre_id' => genre2.id
})
record5.save()

record6 = Record.new({
  'record_title' => 'Baby one more time',
  'artist_id' => artist3.id,
  'genre_id' => genre4.id
})
record6.save()

record7 = Record.new({
  'record_title' => 'St Anger',
  'artist_id' => artist4.id,
  'genre_id' => genre3.id
})
record7.save()

record8 = Record.new({
  'record_title' => 'Trans',
  'artist_id' => artist5.id,
  'genre_id' => genre6.id
})
record8.save()

record9 = Record.new({
  'record_title' => 'Mirrorball',
  'artist_id' => artist5.id,
  'genre_id' => genre3.id
})
record9.save()

record10 = Record.new({
  'record_title' => 'Unplugged',
  'artist_id' => artist2.id,
  'genre_id' => genre2.id
})
record10.save()


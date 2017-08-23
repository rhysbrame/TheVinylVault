require_relative( '../db/sql_runner' )

class Record

  attr_reader :id, :record_title, :artist_id, :genre_id

  def initialize( record_hash )
    @id = record_hash['id'].to_i
    @record_title = record_hash['record_title']
    @artist_id = record_hash['artist_id'].to_i
    @genre_id = record_hash['genre_id'].to_i
  end

  def save
    
  end

end
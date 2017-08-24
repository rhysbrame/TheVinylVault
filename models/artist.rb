require_relative( '../db/sql_runner' )

class Artist

  attr_reader :id, :artist_name

  def initialize( artist_hash )
    @id = artist_hash['id'].to_i
    @artist_name = artist_hash['artist_name']
  end

end

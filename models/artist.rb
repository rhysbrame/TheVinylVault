require_relative( '../db/sql_runner' )

class Artist

  attr_reader :id, :artist_name

  def initialize( artist_hash )
    @id = artist_hash['id'].to_i
    @artist_name = artist_hash['artist_name']
  end

  def save
    sql = "INSERT INTO artists ( artist_name ) VALUES ('#{@artist_name}') RETURNING id"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def delete
    sql = "DELETE FROM artists WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE artists SET (artist_name) = ('#{@artist_name}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    result = artists.map { |artist| Artist.new(artist) }
    return result
  end

  def sefl.find()


end
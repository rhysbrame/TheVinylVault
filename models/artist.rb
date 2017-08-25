require_relative( '../db/sql_runner' )

class Artist

  attr_reader :id, :artist_name

  def initialize( artist_hash )
    @id = nil || artist_hash['id'].to_i
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

  def records
    sql = "SELECT * FROM artists a
    INNER JOIN records r
    ON r.artist_id = a.id
    WHERE artist_id = #{id}
    ORDER BY artist_name ASC"
    record_hashes = SqlRunner.run(sql)
    return record_hashes.map { |records| Record.new(records) }
  end

  def self.all()
    sql = "SELECT * FROM artists ORDER BY artist_name ASC"
    artists = SqlRunner.run(sql)
    result = artists.map { |artist| Artist.new(artist) }
    return result
  end

  def self.find(find_id)
    sql = "SELECT * FROM artists WHERE id = #{find_id}"
    artist = SqlRunner.run(sql).first
    result = Artist.new(artist)
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    result = SqlRunner.run(sql)
    return result
  end
end
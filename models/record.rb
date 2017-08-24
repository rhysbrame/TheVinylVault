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
    sql = "INSERT INTO records (record_title, artist_id, genre_id) VALUES ('#{@record_title}','#{@artist_id}', '#{@genre_id}') RETURNING id"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def delete
    sql = "DELETE FROM records WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE records SET (record_title, artist_id, genre_id) = ('#{@record_title}','#{@artist_id}', '#{@genre_id}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def artist
    sql = "SELECT * FROM artists WHERE id = #{@id}"
    artist_hash = SqlRunner.run(sql).first
    return Artist.new(artist_hash)
  end

  def genre
    sql = "SELECT * FROM genres WHERE id = #{@id}"
    genre_hash = SqlRunner.run(sql).first
    return Genre.new(genre_hash)
  end

  def self.all()
    sql = "SELECT * FROM records"
    records = SqlRunner.run(sql)
    result = records.map { | record | Record.new(record) }
    return result
  end

  def self.find(find_id)
    sql = "SELECT * FROM records WHERE id = #{find_id}"
    record = SqlRunner.run(sql).first
    result = Record.new(record)
    return result
  end

  def self.delete_all
    sql = "DELETE FROM records"
    result = SqlRunner.run(sql)
    return result
  end
end
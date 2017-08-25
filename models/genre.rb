require_relative( '../db/sql_runner' )

class Genre

  attr_reader :id, :genre_type

  def initialize( genre_hash )
    @id = nil || genre_hash['id'].to_i
    @genre_type = genre_hash['genre_type']
  end

  def save
    sql = "INSERT INTO genres ( genre_type ) VALUES ('#{@genre_type}') RETURNING id"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def delete
    sql = "DELETE FROM genres WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def update
    sql = "UPDATE genres SET (genre_type) = ('#{@genre_type}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def records
    sql = "SELECT * FROM genres g
      INNER JOIN records r
      ON r.genre_id = g.id
      WHERE g.id = #{@id}
      ORDER BY artist_name, record_title ASC"
    results = SqlRunner.run(sql)
    return results.map{ |record_by_genre| Record.new(record_by_genre) }
  end

  def artists
    sql = "SELECT * FROM genres g 
    INNER JOIN records r
    ON r.genre_id = g.id
    INNER JOIN artists a
    ON r.artist_id = a.id
    WHERE g.id = #{@id}
    ORDER BY artist_name, record_title ASC"
    results = SqlRunner.run(sql)
    return results.map { |artist_by_genre| Record.new(artist_by_genre) }
  end

  def self.all()
    sql = "SELECT * FROM genres
    ORDER BY genre_type ASC"
    genres = SqlRunner.run(sql)
    results = genres.map { |genre| Genre.new(genre) }
    return results
  end

  def self.find(find_id)
    sql = "SELECT * FROM genres WHERE id = #{find_id}"
    genre = SqlRunner.run(sql).first
    result = Genre.new(genre)
    return result
  end

  def self.delete_all
    sql = "DELETE FROM genres"
    result = SqlRunner.run(sql)
    return result
  end
end
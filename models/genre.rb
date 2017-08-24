require_relative( '../db/sql_runner' )

class Genre

  attr_reader :id, :genre_type

  def initialize( genre_hash )
    @id = genre_hash['id'].to_i
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

  def self.all()
    sql = "SELECT * FROM genres"
    genres = SqlRunner.run(sql)
    result = genres.map { |genre| Genre.new(genre) }
    return result
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
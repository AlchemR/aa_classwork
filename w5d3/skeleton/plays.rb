require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(titles)
      PlayDBConnection.instance.execute(<<-SQL, titles)
      SELECT *
      FROM plays
      WHERE
         title = titles 
    SQL

  end

  def self.find_by_playwright(names)
      PlayDBConnection.instance.execute(<<-SQL, names)
      SELECT *
      FROM playwrights
      WHERE
         name = names
    SQL
    #need a join function from playwrights to ID's to plays written?
  end


end


class Playwright

def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
    data.map { |datum| Playwright.new(datum) }  
end

def self.find_by_name(name)
       findname =  PlayDBConnection.instance.execute(<<-SQL, names)
      SELECT *
      FROM playwrights
      WHERE
         name = ?
    SQL
#do something with findname
end

def self.new(options)
  #  plays (title, year, playwright_id)
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
end

def create
      raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
end

def update
      raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
end

def get_plays(playwright_id)
      #need a join function from playwrights to ID's to plays written?
    playwrightid =  PlayDBConnection.instance.execute(<<-SQL, self.playwright_id)
    SELECT *
    FROM
    WHERE playwright_id = ?
     SQL
     #do something with playwrightid
end

end

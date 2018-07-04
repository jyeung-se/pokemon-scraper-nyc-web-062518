
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end


	def self.find(id, db)
		info_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
		Pokemon.new(id: info_array[0], name: info_array[1], db: db, type: info_array[2], hp: info_array[3])
	end


  def alter_hp(hp, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
	end


end

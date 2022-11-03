class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:,type:,db:)
        @id=id
        @name=name
        @type=type
        @db=db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)", name,type)
    end

    def self.find(id, db)
        pokemon_pull=db.execute("SELECT * FROM pokemon WHERE id=?",id)[0]

        self.new(id:pokemon_pull[0],name:pokemon_pull[1],type:pokemon_pull[2],db:pokemon_pull[3])

    end
end

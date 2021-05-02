class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(options={})
        options.each do |key, value|
        self.send("#{key}=", value) if respond_to?("#{key}=")
        end
    end

    def self.save(name, type, db)
        db.execute(
          "INSERT INTO pokemon (name, type)
          VALUES (?, ?)",name, type)
    end

    def self.find(idn, database)
        found_pokemon = database.execute(
            "SELECT * FROM pokemon 
            WHERE id=?", idn).flatten
        Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2])
    end

end

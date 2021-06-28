class Listicle

    @@all = []
    attr_reader :name, 

    def self.all
        @@all
    end

    def self.save
        @@all << self
    end
    
    def self.create(listicle_title, listicle_description)
        @listicle_title = listicle_title
        @listicle_description = listicle_description
        save
    end

    def title=(listicle_title)
        @listicle_title = listicle_title
    end


    
    def add_rec(recipe)
        recipe.listicle = self unless recipe.listicle != nil
    end

    def recipes
        Recipe.all.select do |recipe|
            recipe.listicle = self
        end
    end


    

end
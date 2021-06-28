class Listicle

    @@all = []
    attr_reader :title, :description


    #Class
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

    #Instance
    def title=(listicle_title)
        @listicle_title = listicle_title
    end

    def description=(listicle_description)
        @listicle_description = listicle_description
    end

    
    def add_rec(recipe)
        recipe.listicle = self unless recipe.listicle != nil
    end

    def recipes
        Recipe.all.select do |recipe|
            recipe.listicle = self
        end
    end

    def print_listicle
        
    end

en
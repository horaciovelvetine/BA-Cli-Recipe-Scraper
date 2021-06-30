class Listicle

    @@all = []
    attr_reader :title, :description, :recipe_collection


    #Class

    def initialize(listicle_title, listicle_description)
        @listicle_title = listicle_title
        @listicle_description = listicle_description
        @recipe_collection = []
    end

   
    def self.all
        @@all
    end

    def self.save
        @@all << self
    end
    
    def self.create(listicle_title, listicle_description)
        listicle = Listicle.new(listicle_title, listicle_description)
        self.save
        listicle
    end

    def title 
        @listicle_title
    end

    def description
        @listicle_description
    end

    def recipes
        @recipe_collection
    end
    



end

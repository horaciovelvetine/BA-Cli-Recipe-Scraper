class Listicle

    @@all = []
    attr_accessor :title, :description, :recipe_collection, :recipe


    #Class
    def self.all
        @@all
    end
    
    def all
        @@all
    end
    

    def save
        @@all << self
    end

    def initialize(listicle_title, listicle_description)
        @title = listicle_title
        @description = listicle_description
        @recipe_collection = []
    end
    
    def self.create(listicle_title, listicle_description)
        listicle = Listicle.new(listicle_title, listicle_description)
        listicle.save
        listicle
    end


end

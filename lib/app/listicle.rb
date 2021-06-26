class Listicle

    @@all = []
    attr_accessor :recipe_collection, :create_rec

    def self.all
        @@all
    end

    def self.save
        @@all << self
    end
    
    def self.create(listicle_title, listicle_description)
        @listicle_title = listicle_title
        @listicle_description = listicle_description
        @recipe_collection = []
        save
    end


    # def create_rec(rec_title, rec_blurb, rec_url)
    #     Recipe.create(rec_title, rec_blurb, rec_url)
    # end

    

end
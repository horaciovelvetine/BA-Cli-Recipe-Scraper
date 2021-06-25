class Listicle

    @@all = []
    attr_reader :print_explore_listicle_menu

    def self.all
        @@all
    end

    def self.save
        @@all << self
    end
    
    def self.create(listicle_title, listicle_description)
        @listicle_title = listicle_title
        @listicle_description =listicle_description
        recipe_list = []
        save
    end


    
    def self.add_and_create_rec(rec_title, rec_blurb, rec_url) ,#parent_listicle)
        Recipe.create(rec_title, rec_blurb, rec_url) ,#parent_listicle)

        
    end

end
class Recipe

    @@all = []
    attr_accessor

    def self.all
        @@all
    end


    def create_and_add_to_listicle(rec_title, rec_blurb, rec_url, parent_listicle)
        #gives each instance of created recipe its own copy of the variables
        @rec_title = rec_title
        @rec_blurb = rec_blurb
        @rec_url = rec_url
        @parent_listicle = parent_listicle

    
    
    
    end

end
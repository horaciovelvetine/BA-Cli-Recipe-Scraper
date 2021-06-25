class Recipe

    @@all = []
    attr_accessor

    def self.all
        @@all
    end

    def self.create(rec_title, rec_blurb, rec_url)
        @rec_title = rec_title
        @rec_blurb = rec_blurb
        @rec_url = rec_url
        #### Still debating the need for this... for now comment 
        #### @parent_listicle = parent_listicle



    end


    
    
    
    end

end
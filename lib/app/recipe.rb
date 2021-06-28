class Recipe

    @@all = []
    attr_reader :title, :blurb, :url, :listicle


    #Class
    def self.all
        @@all
    end

    def self.create(rec_title, rec_blurb, rec_url, parent_listicle)
        @rec_title = rec_title
        @rec_blurb = rec_blurb
        @rec_url = rec_url
        @parent_listicle = parent_listicle
        save
        # self
    end





    #Instance
    def self.save
        @@all << self
    end

    def title=(rec_title)
        @rec_title = rec_title
    end

    def blurb=(rec_blurb)
        @rec_blurb = rec_blurb
    end

    def url=(rec_url)
        @rec_url = rec_url
    end
    
    def listicle=(parent_listicle)
        @parent_listicle = parent_listicle
        Listicle.add_rec(self)
    end




end
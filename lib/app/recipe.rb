class Recipe

    @@all = []
    attr_reader :title, :blurb, :url, :listicle


    #Class
    def self.all
        @@all
    end

    def initialize(rec_title, rec_blurb, rec_url, parent_listicle)
        @rec_title = rec_title
        @rec_blurb = rec_blurb
        @rec_url = rec_url
        @parent_listicle = parent_listicle
    end

    def self.create(rec_title, rec_blurb, rec_url, parent_listicle)  
        Recipe.new(rec_title, rec_blurb, rec_url, parent_listicle)
        parent_listicle.recipe_collection << self 
        save
        # self
    end

    def self.save
        @@all << self
    end

    def self.title 
        @rec_title
    end






end
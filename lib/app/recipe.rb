class Recipe

    @@all = []
    attr_accessor :title, :blurb, :url, :parent_listicle, :recipe


    #Class
    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def initialize(rec_title, rec_blurb, rec_url, parent_listicle)
        @title = rec_title
        @blurb = rec_blurb
        @url = rec_url
        @parent_listicle = parent_listicle
    end

    def self.create(rec_title, rec_blurb, rec_url, parent_listicle)  
        # @rec_title = rec_title
        # @rec_blurb = rec_blurb
        # @rec_url = rec_url
        # @parent_listicle = parent_listicle
        
        recipe = Recipe.new(rec_title, rec_blurb, rec_url, parent_listicle)
        recipe.save
        parent_listicle.recipe_collection << recipe 
        recipe
    end


    # def title
    #    @rec_title
    # end

    # def blurb
    #     @rec_blurb
    # end

    # def self.url
    #     @rec_url
    # end

    # def self.parent
    #     @parent_listicle
    # end

end
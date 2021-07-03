class Recipe

    @@all = []
    attr_reader :title, :blurb, :url, :parent_listicle, :recipe, :rating, :author, :serves, :ingredients, :instructions


    #Class
    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def initialize(rec_title, rec_blurb, rec_url, parent_listicle, rec_rating, rec_author, rec_servings)
        @title = rec_title
        @blurb = rec_blurb
        @url = rec_url
        @parent_listicle = parent_listicle
        @rating = rec_rating
        @author = rec_author
        @serves = rec_servings
        @ingredients = []
        @instructions = []
    end

    def self.create(rec_title, rec_blurb, rec_url, parent_listicle, rec_rating, rec_author, rec_servings)  
        recipe = Recipe.new(rec_title, rec_blurb, rec_url, parent_listicle, rec_rating, rec_author, rec_servings)
        recipe.save
        parent_listicle.recipe_collection << recipe 
        recipe
    end

end
class Recipe

    @@all = []
    attr_accessor :rec_title, :rec_blurb, :rec_url, :rec_ingredients_and_quantities, :rec_steps

    def self.all
        @@all
    end

    def self.create(rec_title, rec_blurb, rec_url, parent_listicle)
        @rec_title = rec_title
        @rec_blurb = rec_blurb
        @rec_url = rec_url
        @parent_listicle = parent_listicle
        #add_rec_to_listicle(@parent_listicle)
        self
    end


    def add_more_info_to_rec(rec_ingredient_quantity, rec_ingredient, rec_steps)
        @rec_ingredients_and_quantities = {}
        @rec_steps =[]
    end

    # def add_rec_to_listicle(parent_listicle)
    #     if listicle.recipe_collection.include?("#{parent_listicle}")
    #         recipe_collection << self
    #     else
    #         puts "invalid test error, james what are you doing now."
    #     end
    # end


end
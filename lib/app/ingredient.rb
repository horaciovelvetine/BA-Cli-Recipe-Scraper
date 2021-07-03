class Ingredient

    @@all = []
    attr_reader :name_w_amount, :parent

    def self.all
        @@all
    end

    def self.create_by_array(ingreds_w_amounts, parent_recipe)
        ingreds_w_amounts.each do |name_w_amount|
            create(name_w_amount, parent_recipe)
        end
    end

    def self.create(name_w_amount, parent_recipe)
        ingredient = Ingredient.new(name_w_amount, parent_recipe)
        ingredient.save
        parent_recipe.ingredients << ingredient
    end

    def initialize(name_w_amount, parent_recipe)
        @name_w_amount = name_w_amount
        @parent = parent_recipe
    end

    def save
        @@all << self
    end
    

    
end
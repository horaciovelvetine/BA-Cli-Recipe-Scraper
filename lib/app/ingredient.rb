class Ingredient

    @@all = []
    attr_reader :text, :parent

    def self.all
        @@all
    end

    def initialize(name_w_amount, parent_recipe)
        @text = name_w_amount
        @parent = parent_recipe
    end

    def create(name_w_amount, parent_recipe)
        indgredient = Ingredient.new(name_w_amount, parent_recipe)
        ingredient.save
        recipe.ingredients << self
    end
    
end
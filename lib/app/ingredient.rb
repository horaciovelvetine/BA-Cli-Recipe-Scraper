class Ingredient

    @@all = []
    attr_reader :amount_w_name, :parent

    def self.all
        @@all
    end


    def self.create(amount, name, parent_recipe)
        ingredient = Ingredient.new(amount, name, parent_recipe)
        puts ingredient
        binding.pry
        ingredient.save
        parent_recipe.ingredients << self
    end

    def save
        @@all << self
    end
    
    def initialize(amount, name, parent_recipe)
        @amount_w_name = "#{amount}#{name}"
        @parent = parent_recipe
    end
    
end
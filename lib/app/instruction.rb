class Instruction 

    attr_reader :text, :parent

    def initialize(text, parent_recipe)
        @text = text
        @parent = parent_recipe
    end

    def self.create(text, parent_recipe)
        new_step = Instruction.new(text, parent_recipe)
        parent_recipe.instructions << new_step
    end

end

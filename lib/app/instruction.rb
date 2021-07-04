class Instruction 

    attr_reader :text, :parent

    def initialize(new_step, parent_recipe)
        @text = new_step
        @parent = parent_recipe
    end

    def self.create(new_step, parent_recipe)
        step = Instruction.new(new_step, parent_recipe)
        parent_recipe.instructions << step
    end

end

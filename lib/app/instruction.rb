class Instruction 

    attr_reader :step, :parent

    def initialize(new_step, parent_recipe)
        @step = new_step
        @parent = parent_recipe
    end

    def self.create(new_step, parent_recipe)
        step = Instruction.new(new_step, parent_recipe)
        parent_recipe.instructions << step
    end

end

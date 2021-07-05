class Instruction 

    attr_reader :print, :parent

    def initialize(new_step, parent_recipe)
        @print = new_step
        @parent = parent_recipe
    end

    def self.create(new_step, parent_recipe)
        step = Instruction.new(new_step, parent_recipe)
        parent_recipe.instructions << step
    end

end

#V0.0.1 Fin

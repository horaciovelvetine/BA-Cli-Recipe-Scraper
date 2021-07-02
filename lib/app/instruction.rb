class Instruction 

    attr_reader :text, :parent

    def initialize(text, parent_recipe)
        @text = text
        @parent = parent_recipe
    end

    def create(text, parent_recipe)
        new_step = Instruction.new(text)
        new_step.save
        parent_recipe.instructions << self
    end

end

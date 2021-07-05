class Shopping_List

    attr_accessor :list

        @@list = []

        # @list = @@list

        def self.list
            @@list
        end


        def self.add_ingredients_array(ingredients)
            if ingredients != nil || false || "nil"
                ingredients.each do |ingredient|
                    @@list << ingredient
                end
            else 
                puts "no ingredients added"
                @@list << ingredients
            end
        end

        def add_single_ingredient(ingredient)
            @list << ingredient
        end


end

#V0.0.1 Fin

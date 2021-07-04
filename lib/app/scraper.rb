require_relative "../../config/environment"

class Scraper
    


    #--The initial scrape which parses out the listicle @ the 1st level--#
    def self.scrape_ba_listicle(link_to_scrape)
        url = link_to_scrape
        html = open(url)
        listicle_info = Nokogiri::HTML(html)
        listicle_title = listicle_info.css('.content-header__title-block').css("h1").text
        listicle_description = listicle_info.css('.content-header__dek').text
        parent_listicle = Listicle.create(listicle_title, listicle_description)
        
        #---DO NOT REMOVE---# 
        #puts listicle_title
        #puts listicle_description
        #puts parent_listicle

        #---Sets scraper to creating individual recipes---#
        initial_scrape(listicle_info, parent_listicle)

    end

    def self.initial_scrape(listicle_info, parent_listicle)
        #--Scrapes the first layer of information from listicle--#
        initial_recipe_elements = listicle_info.css('.gallery-slide__content')
        initial_recipe_elements.each do |recipe|
            rec_title = recipe.css('.gallery-slide-caption__hed-text').text
            rec_blurb = recipe.css('.gallery-slide-caption__dek').text
            rec_url = recipe.css('.external-link').attr("href")
            parent_recipe = Recipe.create(rec_title, rec_blurb, rec_url, parent_listicle)
            more_info_scrape(rec_url, parent_recipe)
        end 
        Cli.loading_finish
        # binding.pry
        Cli.explore_listicle_menu(parent_listicle) 
    end

    def self.more_info_scrape(rec_url, parent_recipe)
      
        url = rec_url
        if url != nil || "nil" || false
            html = open(url)
            more_info = Nokogiri::HTML(html)
            rec_rating = more_info.css('.isYfga').text
            rec_author = "Bon - Apetit"
            #original line, above is modified
            # rec_author = more_info.css('.byline__name').css('a').first.text
            rec_servings = more_info.css('.flNKQv').text
            
            parent_recipe.add_more_info(rec_rating, rec_author, rec_servings)
            #binding.pry
            ingredients_scrape(rec_url, parent_recipe)
            # binding.pry
            instruction_scrape(rec_url, parent_recipe)
            # binding.pry
        else
            #theres likely a better way to do this, maybe a seperate method?? 
            rec_rating = "Add'l info not availble on this guy, sorry!"
            rec_author ="Add'l info not availble on this guy, sorry!"
            rec_servings = "Add'l info not availble on this guy, sorry!"
            parent_recipe.instructions << "Instructions unavailible, try searching BA directly"
            parent_recipe.ingredients << "Uh oh, looks like you added a recipe to your cart that doesnt have ingredients, sorry about that!"
        end
        


    end

    def self.ingredients_scrape(rec_url, parent_recipe)
        
        amounts = []
        names = []

        url = rec_url
        html = open(url)
        more_info = Nokogiri::HTML(html)
        ingredients_w_amounts = more_info.css('.recipe__ingredient-list')

        just_amounts = ingredients_w_amounts.css('.ipiKWu')
        just_amounts.each do |amnt|
            amount = amnt.children.text
            amounts << amount
        end

        just_names = ingredients_w_amounts.css('.OSpFc') 
        just_names.each do |name|
            name = name.children.text
            names << name
        end
       
        #---DO NOT REMOVE---# 
        # puts names
        # puts amounts
        # binding.pry 

        bas_funky_format_fixer(amounts, names, parent_recipe)
        
    end      
    
    def self.bas_funky_format_fixer(amounts, names, parent_recipe)
        names_w_amounts = amounts.zip(names)

        ingreds_w_amounts = []
        element_selector = 0

        names_w_amounts.each do |elements|
            elem = names_w_amounts[element_selector]
            element_selector += 1
            combined = elem.join(" ")
            ingreds_w_amounts << combined
        end
        Ingredient.create_by_array(ingreds_w_amounts, parent_recipe)
    end

    def self.instruction_scrape(rec_url, parent_recipe)
    
        url = rec_url
        html = open(url)
        more_info = Nokogiri::HTML(html)
        steps = more_info.css('.efQlxQ')
        steps.each do |step|
            new_step = step.text
            Instruction.create(new_step, parent_recipe)
        end
    end
end



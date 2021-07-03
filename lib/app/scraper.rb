require_relative "../../config/environment"

class Scraper
    #prevent repeating yourself 
    def self.noko_init(url)
        html = open(url)
        @scraped_info = Nokogiri::HTML(html)
    end

    #--The initial scrape which parses out the listicle @ the 1st level--#
    def self.scrape_ba_listicle(link_to_scrape)
        noko_init(link_to_scrape)
        listicle_title = @scraped_info.css('.content-header__title-block').css("h1").text
        listicle_description = @scraped_info.css('.content-header__dek').text
        parent_listicle = Listicle.create(listicle_title, listicle_description)
        scraped_info = @scraped_info
         
        
        #---DO NOT REMOVE---# 
        #puts listicle_title
        #puts listicle_description
        #puts parent_listicle

        #---Sets scraper to creating individual recipes---#
        initial_scrape(scraped_info, parent_listicle)

        

    end

    def self.initial_scrape(scraped_info, parent_listicle)
        #--Scrapes the first layer of information from listicle--#
        initial_recipe_elements = @scraped_info.css('.gallery-slide__content')
        initial_recipe_elements.each do |recipe|
            rec_title = recipe.css('.gallery-slide-caption__hed-text').text
            rec_blurb = recipe.css('.gallery-slide-caption__dek').text
            rec_url = recipe.css('.external-link').attr("href")
            more_info_scrape(rec_title, rec_blurb, rec_url, parent_listicle)
        end 
    end

    def self.more_info_scrape(rec_title, rec_blurb, rec_url, parent_listicle)
        noko_init(rec_url)
        rec_rating = @scraped_info.css('.isYfga').text
        rec_author = @scraped_info.css('.byline__name').css('a').first.text
        rec_servings = @scraped_info.css('.flNKQv').text

        #---DO NOT REMOVE---#
        #Prints out each bit of information
        # puts rec_title
        # puts rec_blurb
        # puts "#{rec_url}"
        # puts rec_rating
        # puts rec_author
        # puts rec_servings
        
        parent_recipe = Recipe.create(rec_title, rec_blurb, rec_url, parent_listicle, rec_rating, rec_author, rec_servings)

        ingredients_scrape(rec_url, parent_recipe)
        parent_recipe
        binding.pry
        instruction_scrape(rec_url, parent_recipe)
    end

    def self.ingredients_scrape(rec_url, parent_recipe)
        noko_init(rec_url)
        ingredients_html = @scraped_info.css('.recipe__ingredient-list')
        ingredients_html.each do |ingr|
            amount = ingr.css('.ipiKWu')first.text
            name = ingr.css('.OSpFc')first.text

            binding.pry

            ingredient = Ingredient.create(amount, name, parent_recipe)
        end


 
    end   
    
    def self.instruction_scrape (rec_url, parent_recipe)
        noko_init(rec_url)

    
    end

end


    # binding.pry
    
    #not really yet, because were gonna have to figure out ingredients / steps
    # Recipe.create(rec_title, rec_blurb, rec_url, parent_listicle)
    # puts "got here"
    # binding.pry
    # Cli.loading_finish
    # Cli.explore_listicle_menu(parent_listicle) 






#Attributes to set:
# rating, total_prep_time, num_servings, author. ingredients[], steps[]



#classes (as narrow scoped as possible, zoom out + add'l tags??)

#@rating: sc-pNWdM sc-jrsJWt sc-bgPuHN lfZoIg kVXRTs isYfga .text



#@total_time_to_prepare: sc-pNWdM sc-jrsJWt sc-QBqQR lfZoIg dvVxgI .text
#@num_of_servings: sc-pNWdM sc-jrsJWt sc-czWueg lfZoIg dvVxgI flNKQv .text
#@author: sc-pNWdM sc-jrsJWt sc-kEqXSa sc-fxFQKN lfZoIg gbRvFD gXETNs crwdyJ byline__name-link button .text



#ingredients (sc-fYRKEF kSBiAJ)
    #amount (sc-pNWdM sc-jrsJWt sc-jHCTGH lfZoIg cKBuBY ipiKWu)
    #ingredient_name (sc-pNWdM sc-jrsJWt sc-gfPHdM lfZoIg cKBuBY OSpFc)

#instructions (todos: sc-pNWdM sc-cBaREX bSrwjR)
    #indiv (sc-pNWdM sc-jrsJWt sc-iONbRl lfZoIg cfXWxZ efQlxQ)('p') .text





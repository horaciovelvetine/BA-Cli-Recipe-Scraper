require_relative "../../config/environment"

class Scraper

    #--The initial scrape which parses out the listicle @ the 1st level--#
    def self.scrape_ba_listicle(link_to_scrape)
        url = link_to_scrape
        html = open(url)
        listicle_html_parsed = Nokogiri::HTML(html)
        
        #--Pre-Scrapes the title of the Listicle itself--#
        listicle_title = listicle_html_parsed.css('.content-header__title-block').css("h1").text
        listicle_description = listicle_html_parsed.css('.content-header__dek').text
        parent_listicle = Listicle.create(listicle_title, listicle_description)
         
        
        #---DO NOT REMOVE---# 
        #puts listicle_title

        #---Sets scraper to creating individual recipes---#
        individual_element_scrape(listicle_html_parsed, parent_listicle)

        Cli.explore_listicle_menu(parent_listicle)


    end

    def self.individual_element_scrape(listicle_html_parsed, parent_listicle)
        #--Scrapes the first layer of information from listicle--#
        individual_recipe_elements = listicle_html_parsed.css('.gallery-slide__content')
        individual_recipe_elements.each do |recipe_element|
            rec_title = recipe_element.css('.gallery-slide-caption__hed-text').text
            rec_blurb = recipe_element.css('.gallery-slide-caption__dek').text
            rec_url = recipe_element.css('.external-link').attr("href")

            Recipe.create(rec_title, rec_blurb, rec_url, parent_listicle)
            #---DO NOT REMOVE---#
            #Prints out each bit of information
            # puts rec_title
            # puts rec_blurb
            # puts "#{rec_url}"

        end
        Cli.loading_finish
        Cli.ui_pause
    end


end






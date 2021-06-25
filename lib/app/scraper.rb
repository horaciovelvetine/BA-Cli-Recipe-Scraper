require_relative "../../config/environment"

class Scraper

    #--The initial scrape which parses out the listicle @ the 1st level. 
    def self.scrape_ba_listicle(link_to_scrape)
        url = link_to_scrape
        html = open(url)
        listicle_html_parsed = Nokogiri::HTML(html)
        
        #--Pre-Scrapes the title of the Listicle itself--#
        listicle_title = listicle_html_parsed.css('.content-header__title-block').css("h1").text
        listicle_description = listicle_html_parsed.css('.content-header__row').text
        Listicle.create(listicle_title, listicle_description)
        parent_listicle = listicle_title
        #in case of test! #---DO NOT REMOVE---#
        #puts listicle_title

        #--Scrapes the first layer of information from listicle--#
        individual_recipe_elements = listicle_html_parsed.css('.gallery-slide__content')
        individual_recipe_elements.each do |recipe_element|
            rec_title = recipe_element.css('.gallery-slide-caption__hed-text').text
            rec_blurb = recipe_element.css('.gallery-slide-caption__dek').text
            rec_url = recipe_element.css('.external-link').attr("href")

            Listicle.add_and_create_rec(rec_title, rec_blurb, rec_url, parent_listicle)
            #---DO NOT REMOVE---#
            #Prints out each bit of information for checking scraper
            #puts rec_title
            #puts rec_blurb
            #puts "#{rec_url}"
        end
        
        Cli.loading_finish
        Cli.ui_pause
        Cli.explore_listicle_menu
    end

    def self.scrape_ba_more_info(more_info_url)
        mi_url = more_info_url
        html = open(mi_url)
        more_info_parsed = Nokogiri::HTML(html)

        more_info_parsed = recipe_more_parsed.css('TAG INFO THAT PULLS')
        more_info_parsed.each do |mi_element|
            rec_rating = mi_element.css('pulls out the # rating')
            rec_instructions = mi_element.css('pulls out steps')
            rec_ingredient_quantity = mi_element.css('just quantity of ingredient')
            rec_ingredient = mi_element.css('just ingredients themselves')
        end   
    end
end

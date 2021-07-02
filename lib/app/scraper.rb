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
        first_element_scrape(listicle_html_parsed, parent_listicle)

        

    end

    def self.first_element_scrape(listicle_html_parsed, parent_listicle)
        #--Scrapes the first layer of information from listicle--#
        first_recipe_elements = listicle_html_parsed.css('.gallery-slide__content')
        first_recipe_elements.each do |recipe|
            rec_title = recipe.css('.gallery-slide-caption__hed-text').text
            rec_blurb = recipe.css('.gallery-slide-caption__dek').text
            rec_url = recipe.css('.external-link').attr("href")

            more_info_details(rec_title, rec_blurb, rec_url)
                        

            
        end
        # puts "got here"
    # binding.pry
    # Cli.loading_finish
    # Cli.explore_listicle_menu(parent_listicle)    
    end

    def self.more_info_details(rec_title, rec_blurb, rec_url)
            url = rec_url
            html = open(url)
            more_info_parsed = Nokogiri::HTML(html)
            rec_rating = more_info_parsed.css('.isYfga').text
            rec_author = more_info_parsed.css('.byline__name').css('a').first.text
            rec_servings = more_info_parsed.css('.flNKQv').text

            


            #---DO NOT REMOVE---#
            #Prints out each bit of informatio
            # puts rec_title
            # puts rec_blurb
            # puts "#{rec_url}"
            # puts rec_rating
            # puts rec_author
            # puts rec_servings

            # binding.pry
            
            #not really yet, because were gonna have to figure out ingredients / steps
            # Recipe.create(rec_title, rec_blurb, rec_url, parent_listicle)
            
            
    end



    # def self.get_more_info(more_info_link, parent_recipe)
    #     url = more_info_link
    #     html = open(url)
    #     recipe_more_info_parsed = Nokogiri::HTML(html)

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





    # end
    

end






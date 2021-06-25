require_relative "../../config/environment"

class Scraper

    def self.scrape_ba_listicle(link_to_scrape)
        url = link_to_scrape
        html = open(url)
        listicle_html_parsed = Nokogiri::HTML(html)
        individual_recipe_elements = listicle_html_parsed.css('.gallery-slide__content')
        individual_recipe_elements.each do |recipe_element|
            rec_title = recipe_element.css('.gallery-slide-caption__hed-text').text
            rec_blurb = recipe_element.css('.gallery-slide-caption__dek').text
            rec_url = recipe_element.css('.external-link').attr("href")

            puts rec_title
            puts rec_blurb
            puts "#{rec_url}"
        end
    end
end







# class Scraper

#     attr_accessor 
#     attr_reader :scrape_ba_listicle, :scrape_more_info

#     #so begins the scraper ordeal
#     def scrape_ba_listicle(link_to_scrape)
#         url = link_to_scrape
#         html = open(url)
#         listicle_html_parsed = Nokogiri::HTML(html)
        
        
#         #does this make sense? Should the scraped recipes pull in the title, and then the recipe class use that information 
#         #inside the listicle class to add all of the recipes to that listicle
#         # listicle_title = listicle_html_parsed.css('TAG/INFO THAT PULLS OUT ELEMENT')#dontforget to push this title out
#         # listicle.create_empty_listicle(listicle_title)
        
#         #pulls out individual elements
#         listicle_elements = listicle_html_parsed.css('TAG INFO THAT PULLS OUT ALL OF THE INFO WANTED FRPM SCRAPE')
#         listicle_elements.each do |element|
#             rec_title = element.css('pulls title').strip.text 
#             rec_rating = element.css('pulls rating').strip.text
#             rec_blurb = element.css('pulls blurb').strip.text
#             rec_url =  element.css('pulls title').strip.text
#             recipe.create(rec_title, rec_rating, rec_blurb, rec_url)

#         end
#     end

#     def scrape_more_info(rec_url)
#         mi_url = rec_url
#         html = open(mi_url)
#         recipe_more_parsed = Nokogiri::HTML(html)

#         more_info_elements = recipe_more_parsed.css('TAG INFO THAT PULLS')
#         more_info_elements.each do |mi_element|
#            #i have a feeling this will be more complicated to return than just this step, esp to format correctly
#            #may be better to format these elements inside of thier individual classes...
#             rec_instructions = mi_element.css('pulls out steps')
#             rec_ingredient_quantity = mi_element.css('just quantity of ingredient')
#             rec_ingredient = mi_element.css('just ingredients themselves')
#         end
#     end
# end
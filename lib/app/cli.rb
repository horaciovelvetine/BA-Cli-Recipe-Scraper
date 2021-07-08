class Cli


    ########################################## MAJOR-MENUS #######################################################
    #Beings the Recipe Application /
    def self.run_recipe_app
        print_welcome_message
        unused_input = gets
    end

    def self.top_menu
        print_top_menu
        top_menu_selection =gets.strip
        case top_menu_selection
        when "1" #goes to link_input_menu
            link_input_menu
        when "2" #goes to tutorial_about_menu
            tutorial_about_menu
        when "3" #about the author
            about_the_author
        else #for invalid entries
            print_invalid_input_message
            ui_pause
            linebreak
            top_menu
            
    
        end
    end

    def self.link_input_menu
        ui_pause
        print_link_input_menu
        link_menu_input = gets.strip
        
        #potential rebuild to make menu system less.... janky
        #link_menu_int = gets.to_i - 1
        #case link_menu_input
        #when link_menu_int < 0
            #link_to_scrape = link_menu_input
            #link_scrape_loading_menu
            #Scraper.scrape_ba_listicle(link_to_scrape)
        #when link_menu_int < 1
            #explore_listicle_menu(Listicle.all[link_menu_int])
        #else 
            #recovers errored input?
        #end


        #needs rebuilt
        case link_menu_input
        when "1"
            parent_listicle = Listicle.all[0]
            explore_listicle_menu(parent_listicle)
        when "2"
            parent_listicle = Listicle.all[1]
            explore_listicle_menu(parent_listicle)
        when "3"
            parent_listicle = Listicle.all[2]
            explore_listicle_menu(parent_listicle)
        when "4"
            parent_listicle = Listicle.all[3]
            explore_listicle_menu(parent_listicle)
        when "5"
            parent_listicle = Listicle.all[4]
            explore_listicle_menu(parent_listicle)
        when "6"
            parent_listicle = Listicle.all[5]
            explore_listicle_menu(parent_listicle)
        when "7"
            parent_listicle = Listicle.all[6]
            explore_listicle_menu(parent_listicle)
        when "8"
            parent_listicle = Listicle.all[7]
            explore_listicle_menu(parent_listicle)
        when "9"
            parent_listicle = Listicle.all[8]
            explore_listicle_menu(parent_listicle)
        when "10"
            parent_listicle = Listicle.all[9]
            explore_listicle_menu(parent_listicle)
        when "11"
            parent_listicle = Listicle.all[10]
            explore_listicle_menu(parent_listicle)
        when "12"
            parent_listicle = Listicle.all[11]
            explore_listicle_menu(parent_listicle)
        when "13"
            parent_listicle = Listicle.all[12]
            explore_listicle_menu(parent_listicle)
        when "14"
            parent_listicle = Listicle.all[13]
            explore_listicle_menu(parent_listicle)
        when "15"
            parent_listicle = Listicle.all[14]
            explore_listicle_menu(parent_listicle)
        else 
            link_to_scrape = link_menu_input
            link_scrape_loading_menu
            Scraper.scrape_ba_listicle(link_to_scrape)
        end
    end

    def self.explore_listicle_menu(parent_listicle)
        clear_cli
        print_listicle_explore_menu(parent_listicle, parent_listicle.recipe_collection) 
        explore_listicle_menu_selection = gets.strip
        case explore_listicle_menu_selection
        when "1" #More Info on Recipe
            puts "Which recipe(#) would you like to explore:"
            recipe_selection = gets.strip.to_i - 1
            more_info_menu(parent_listicle, recipe_selection)
        when "2" #Add recipe to shopping list
           puts "Which recipe's(#) ingredients would you like to add?"
           add_to_list_selection = gets.strip.to_i - 1
           ingredients = parent_listicle.recipe_collection[add_to_list_selection].ingredients
           Shopping_List.add_ingredients_array(ingredients)
           display_shopping_list_menu(parent_listicle)
        #    add_ingredients_array(parent_listicle, add_to_list_selection)
        when "3" #see shopping list
            display_shopping_list_menu(parent_listicle)
        when "4" #go to top menu
            top_menu
        when "5" #exit app
            exit_app
        when "6" #hidden hackers menu
            puts "welcome to the thunderdome"
            exit_app
        when "7" #print sorted version of listicle
            # binding.pry
            recipes = parent_listicle.recipe_collection.sort_by {|recipe| recipe.rating}.reverse
            print_listicle_explore_menu(parent_listicle, recipes)
            puts "Hit enter to unsort!"
            wait_for_input = gets.strip
            explore_listicle_menu(parent_listicle)

        else
            print_invalid_input_message
            explore_listicle_menu(parent_listicle)
        end
        
    end

    def self.more_info_menu(parent_listicle, recipe_selection)
        clear_cli
        print_more_info(parent_listicle, recipe_selection)
        more_info_menu_selection = gets.strip
        case more_info_menu_selection
        when "1" #back to listicle
            explore_listicle_menu(parent_listicle)
        when "2" #add ingred to shopping list
            ingredients = parent_listicle.recipe_collection[recipe_selection].ingredients
            Shopping_List.add_ingredients_array(ingredients)
            display_shopping_list_menu(parent_listicle)
        when "3" #see shopping list
            display_shopping_list_menu(parent_listicle)
        when "4" #jump to link menu
            link_input_menu
        when "5"
            exit_app
        else
            print_invalid_input_message 
            more_info_menu(parent_listicle, recipe_selection)
        end


    end

    def self.display_shopping_list_menu(parent_listicle="none")
        clear_cli
        print_shopping_list
        shopping_list_selection = gets.strip
        
        case shopping_list_selection
        when "1" #back to listicle
            if parent_listicle != "none"
                link_input_menu
            else
                explore_listicle_menu(parent_listicle)
            end
        when "2" #back to input
            link_input_menu
        when "3" #im lost, take me home
            top_menu
        when "4" #whoops, actually wanted to scrape something again w/0 screen
            puts "Please paste the (valid!) link you wish to scrape:"
            link_to_scrape = gets.strip
            clear_cli
            linebreak
            loading_pause
            Scraper.scrape_ba_listicle(link_to_scrape)
            loading_finish
        when "5"
            exit_app
        else 
            print_invalid_input_message
            display_shopping_list_menu(parent_listicle)
        end

        
    end

    
    ####################################### PRINTED / FORMATTING METHODS ##########################################
    #all of the stored visual representations of each of the various menus
    def self.print_welcome_message
        threebreaks
        clear_cli
        ui_pause
        puts "================================================"
        puts "================================================"
        linebreak
        puts "     Welcome to Brief Bon Ap Listicle Scraper"
        linebreak
        puts "================================================"
        puts "=================== V 0.0.1 ===================="
        linebreak
        linebreak
        puts "================================================"
        puts "             Press any key to continue"
        puts "================================================"
        linebreak
        ui_pause
    end

    def self.print_top_menu
        clear_cli
        linebreak
        puts "================== TOP MENU ===================="
        puts "================================================"
        linebreak
        puts "              1. Link Input Menu"
        puts "              2. Function / Tutorial"
        puts "              3. About the Author"
        linebreak
        puts "================================================"
        puts "     Press corresponding number then enter"
        puts "================================================"
        linebreak
    end

    def self.print_link_input_menu
        clear_cli
        linebreak
        puts "================= Link Input Menu ===================="
        puts "======================================================" 
        linebreak
        puts "     Paste your link and hit enter to begin     "
        puts "                      -or-                       "
        puts "Or Select from already previously scrapedd listicles: "
        linebreak
        print_previous_listicles
        linebreak
        puts "======================================================"
        puts "======================================================"
        linebreak
    end

    def self.print_previous_listicles
        if Listicle.all.length == 0 
            puts "      There aren't any Listicles to display," 
            puts "      input a few links and come back later!"
        else
            counter = 1
            Listicle.all.each do |listicle|
                
                puts "#{counter}) #{listicle.title}"
                counter += 1

            end
        end
    end

    def self.print_tutorial_menu
        clear_cli
        puts "======================================================================"
        puts "A long time ago (circa 2006) the internet was changer forever"
        puts "the #{make_fun_of_buzzfeed} buzzfeed began clogging the internet with"
        puts "quizzes, articles, and best of all ... the Listicle ..."
        long_pause
        threebreaks
        puts "Now many years later, aspiring chefs are forced to sift through"
        puts "these Listicles searching for something that speaks to thier"
        puts "individual food souls."
        long_pause
        threebreaks
        puts "this (temporarily) ends today"
        linebreak
        puts "Use this scraper with any ^^valid Bon Apetit(e?) listicle"
        puts "and it will pull out all of the crucial pieces of information"
        puts "which you can then use to populate a shopping list, or just"
        puts "explore without the additional ads, long-winded anecdotes"
        puts "or honestly just fluff.... sorry BA..... that often plague"
        puts "these types of listicles."
        linebreak
        long_pause
        threebreaks
        puts "======================================================================" 
        puts "^^Valid articles are normally something theyve tweeted"
        puts "Look for titles like, these X recipes that make our readers"
        puts "go OHWOWOWOWOWOWOW SO GOOD, MUCH TAASTTTTTTY"
        puts "======================================================================"
        long_pause
    end

    def self.print_author_info_menu
        clear_cli
        ui_pause
        threebreaks
        puts "======================================================"
        puts "======================================================"
        puts "======================================================"       
        puts "     Bon Ap Listicle Scraper by: Horacio Velvetine    "
        ui_pause
        puts "Find Me on GitHub: https://github.com/horaciovelvetine"
        ui_pause
        puts "======================= or ==========================="
        ui_pause
        puts "     Twitter @ https://twitter.com/JamesTi25618261    "
        puts "======================================================"
        puts "======================================================"
        puts "======================================================" 
        threebreaks
        long_pause
        long_pause
    end

    def self.print_listicle_explore_menu(parent_listicle, recipes)
        clear_cli
        threebreaks
        puts "==================================================================="
        puts "                  A Brief Overview of Listicle:                    "   
        puts parent_listicle.title
        puts "==================================================================="
        puts "==================================================================="
        linebreak
        puts parent_listicle.description 
        linebreak
        puts "==================================================================="
        linebreak
        puts "                     Now to the good part...                       "
        puts "==================================================================="
        format_recipe_printer(recipes)
        list_pause
        puts "==================================================================="
        puts "==================================================================="
        linebreak
        puts "Select from the following options(1-5):"
        linebreak
        puts "1) More Info  2) Add Ingredients to Shopping List "
        puts "3) See Shopping List 4) Jump to Link/Listicle Input 5) Exit" 
        puts "7) the Dustin"
        linebreak
        ui_pause
    end

    def self.print_more_info(parent_listicle, recipe_selection)
        selection = parent_listicle.recipe_collection[recipe_selection]
        clear_cli
        linebreak
        puts "==================================================================="
        puts "                  #{selection.title}"
        puts "                 By: #{selection.author}"
        puts "==================================================================="
        linebreak
        puts "#{selection.blurb}"
        linebreak
        puts "==================================================================="
        puts "                  What you're gonna need:"
        linebreak
        format_ingredients_printer(selection)
        # puts "#{selection.ingredients.join("\n")}"
        linebreak
        puts "==================================================================="
        puts "                  What you gotta do:"
        linebreak
        format_instructions_printer(selection)
        # puts "#{selection.instructions.join("\n")}"
        linebreak
        puts "==================================================================="
        linebreak
        puts "Select from the following options(1-5):"
        linebreak
        puts "1) Back to Listicle  2) Add Ingredients to Shopping List"
        puts "3) See Shopping List 4) Jump to Link Input Menu  5) Exit"
    end

    def self.print_shopping_list
        linebreak
        clear_cli
        linebreak
        ui_pause
        puts "===================== Shopping List Menu =========================="
        puts "==================================================================="
        linebreak
        if Shopping_List.list.length == 0
            puts "This Shopping List is empty, go pick some recipes and come on back!"
        else
            format_shopping_list_printer
        end
        linebreak
        puts "==================================================================="
        linebreak
        puts "Select from the following options(1-5):"
        linebreak
        puts "1) Back to Listicle  2) Back to Link Input/Listicle Menu"
        puts "3) Top Menu 4) Input Scrapeable Link  5) Exit"
    end

    ######################################### SUB-MENUS ###########################################################
     #automatically returns user to top menu/next menu #

    def self.tutorial_about_menu
        print_tutorial_menu
        tutorial_menu_input=gets.strip
        top_menu
    end

    def self.about_the_author
        print_author_info_menu
        about_the_author_input=gets.strip
        top_menu
    end

    def self.link_scrape_loading_menu
        linebreak
        loading_pause
        linebreak
    end

    ########################################## FORMATTING #########################################################
    #Formatting elements to help pretty up the CLI and make more User Friendly    
    def initialize
        puts "Why are you poking around here, you wanna break somethng?"
        long_pause
        puts "stop it. I dont wanna see you back here."
        top_menu
    end

    def self.loading_pause
        puts "loading... please be patient, this can take a moment!"
    end

    def self.loading_finish
        puts "Loading Complete!"
        ui_pause
        threebreaks
    end
    
    def self.linebreak
        puts "\n"
    end

    def self.threebreaks
        puts "\n"
        puts "\n"
        puts "\n"
    end

    def self.ui_pause
        sleep 0.78
    end

    def self.list_pause
        sleep 0.1
    end

    def self.print_invalid_input_message
        linebreak
        puts "=============================================="
        puts "Invalid Input: Reconsider and Try Again"
        puts "=============================================="
        linebreak
        sleep 2.0

    end

    def self.long_pause
        sleep 3.0
    end

    def self.clear_cli
        linebreak
        system("clear")
    end

    def self.exit_app
        system("exit!")
    end

    def self.make_fun_of_buzzfeed
        "website"
    end


    ############################################## CUSTOM GETTER METHODS ###########################################################


    def self.format_recipe_printer(recipes)
        counter = 1 
        # parent_listicle.recipe_collection.sort {|a, b| b.rating <=> a.rating}.each do |recipe|
       recipes.each do |recipe| 
            puts "#{counter}. #{recipe.title} Rating:(#{recipe.rating})"
            counter += 1
            list_pause
        end

    end

    def self.format_ingredients_printer(selection)
        counter = 1 
        selection.ingredients.each do |ingredient|
            puts "#{counter}) #{ingredient.name_w_amount}"
            counter += 1
            list_pause
        end
    end

    def self.format_instructions_printer(selection)
        counter = 1
        selection.instructions.each do |step|
            puts "#{counter}) #{step.print}"
            counter +=1
            sleep 0.04
        end
    end

    def self.format_shopping_list_printer
       counter = 1
        Shopping_List.list.each do |ingred_w_quantity|
            puts " #{counter}) #{ingred_w_quantity.name_w_amount}"
            list_pause
            counter += 1
        end
    end



end






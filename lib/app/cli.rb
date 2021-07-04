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
        @link_menu_input = link_menu_input
        case link_menu_input
        when "1"
            parent_listicle = listicle.all[0]
            explore_listicle_menu(parent_listicle)
        when "2"
            parent_listicle = listicle.all[1]
            explore_listicle_menu(parent_listicle)

        when "3"
            parent_listicle = listicle.all[2]
            explore_listicle_menu(parent_listicle)
        else 
            link_to_scrape = @link_menu_input
            link_scrape_loading_menu
            Scraper.scrape_ba_listicle(link_to_scrape)
        end
    end

    def self.explore_listicle_menu(parent_listicle)
        print_listicle_explore_menu(parent_listicle)
        
        binding.pry 
        explore_listicle_menu_selection = gets.strip

    
        case explore_listicle_menu_selection
        when "1" #More Info on Recipe 
            # display_more_info(parent_listicle)
            # more_info_menu()

        when "2" #Add recipe to shopping list
            # ask_which_recipe_to_add(parent_listicle)
        when "3" #see shopping list
            # shopping_list_menu
        when "4" #go to top menu
            top_menu
        when "5" #exit app
            exit_app
        when "6" #hidden hackers menu
            puts "welcome to the thunderdome"
            exit_app
        else
            print_invalid_input_message
            explore_listicle_menu(parent_listicle)
        end
        
    end

    def self.more_info_menu



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
        print_previous_listicles
        linebreak
        puts "======================================================"
        puts "======================================================"
        linebreak
    end

    def self.print_previous_listicles
        if Listicle.all.length == 0 
            puts "There aren't any Listicles to display, input a link and come back later!"
        else
            Listicle.all.each do |listicle|
                puts "1) #{listicle.all[0].title}"
                puts "2) #{listicle.all[1].title}"
                puts "3) #{listicle.all[2].title}"
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

    def self.print_listicle_explore_menu(parent_listicle)
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
        format_recipe_printer(parent_listicle)
        list_pause
        puts "==================================================================="
        puts "==================================================================="
        linebreak
        puts "Select from the following options(1-5):"
        linebreak
        puts "1) More Info  2) Add Ingredients to Shopping List "
        puts "3) See Shopping List 4) Jump to Link/Listicle Input 5) Exit"
        linebreak
        ui_pause
    end

    def self.print_more_info(parent_listicle, selection)
        recipe = parent_listicle.recipe_collection[selection]
        clear_cli
        linebreak
        puts "==================================================================="
        puts "                  #{recipe.title}"
        puts "                 By: #{recipe.author}"
        puts "==================================================================="
        linebreak
        puts "#{recipe.blurb}"
        linebreak
        puts "==================================================================="
        puts "                  What you're gonna need:"
        linebreak
        
        # puts "#{test_recipe.ingredients.join("\n")}"
        linebreak
        puts "==================================================================="
        puts "                  What you gotta do:"
        linebreak
        # puts "#{test_recipe.instructions.join("\n")}"
        linebreak
        puts "==================================================================="
        linebreak
        puts "Select from the following options(1-5):"
        linebreak
        puts "1) Back to Listicle  2) Add Ingredients to Shopping List"
        puts "3) See Shopping List 4) Jump to Link/Listicle Input 5) Exit"
        
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


    def self.format_recipe_printer(parent_listicle)
        counter = 1 
        parent_listicle.recipe_collection.each do |recipe|
            puts "#{counter}. #{recipe.title} Rating:(#{recipe.rating})"
            counter += 1
            list_pause
        end

    end

end






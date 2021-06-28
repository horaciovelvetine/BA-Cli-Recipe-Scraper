class Cli

    attr_reader :loading_pause, :linebreak, :print_invalid_input_message, :ui_pause, :threebreaks, :loading_pause, :print_welcome_message, :print_top_menu, :print_link_input_menu, :print_tutorial_menu, :print_author_info_menu, :run_recipe_app, 


########################################## MAJOR-MENUS ###########################################################
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
        @link_menu_input =link_menu_input
        case link_menu_input
        when "1"
            #should look into the listicles list, grab the URL for that the listicle in listicles.all[0] and then pull that link into this function, and then print out that stored listicle item and serve up the interactive_listicle_menu
        when "2"
            #ditto

        when "3"
            #ditto
        else 
            link_to_scrape = @link_menu_input
            link_scrape_loading_menu
            Scraper.scrape_ba_listicle(link_to_scrape)
        end
    end

    def self.explore_listicle_menu
        print_explore_listicle_menu
        linebreak
    end
    
    ####################################### PRINTED / FORMATTING METHODS ##########################################
    #all of the stored visual representations of each of the various menus
    def self.print_welcome_message
        threebreaks
        ui_pause
        puts "========================================"
        puts "========================================"
        linebreak
        puts "Welcome to Brief Bon Ap Listicle Scraper"
        linebreak
        puts "========================================"
        puts "=============== V 0.0.1 ================"
        threebreaks
        ui_pause
        puts "========================================"
        puts "    Press any key & enter to continue   "
        puts "========================================"
        linebreak
        ui_pause
    end

    def self.print_top_menu
        linebreak
        puts "============== Top Menu ================"
        puts "========================================"
        linebreak
        puts "          1. Link Input Menu            "
        puts "          2. Function / Tutorial        "
        puts "          3. About the Author           "
        linebreak
        puts "========================================"
        puts "Press corresponding number then enter"
        puts "========================================"
        linebreak
    end

    def self.print_link_input_menu
        linebreak
        puts "================= Link Menu ===================="
        puts "================================================" 
        linebreak
        puts "     Paste your link and hit enter to begin     "
        puts "                     -or-                       "
        puts "    Or Select from already previous listicles   "
        puts "          *coming in verseion 0.1.0             "
        linebreak
        puts "================================================" 
        puts "================================================" 
        linebreak
    end

    def self.print_tutorial_menu
        "Here lies the tutorial I will type at the end, because its too damn early"
    end

    def self.print_author_info_menu
        ui_pause
        threebreaks
        puts "======================================================"       
        puts "     Bon Ap Listicle Scraper by: Horacio Velvetine    "
        ui_pause
        puts "Find Me on GitHub: https://github.com/horaciovelvetine"
        ui_pause
        puts "======================= or ==========================="
        ui_pause
        puts "     Twitter @ https://twitter.com/JamesTi25618261    "
        puts "======================================================" 
        threebreaks
        long_pause
        long_pause
    end

    def self.print_explore_listicle_menu
        
    end

########################################## SUB-MENUS ###############################################################
     #automatically returns user to top menu/next menu #
    def self.tutorial_about_menu
    
        Cli.print_tutorial_menu
        tutorial_menu_input=gets.strip
        top_menu

    end

    def self.about_the_author
        print_author_info_menu
        threebreaks
        long_pause
        top_menu
    end

    def self.link_scrape_loading_menu
        linebreak
        loading_pause
        linebreak
    end

 ########################################## FORMATTING ##############################################################
    #Formatting elements to help pretty up the CLI and make the app more User Friendly    
    def initialize
        puts "Why are you poking around here, you wanna break somethng?"
        long_pause
        puts "stop it. I dont wanna see you back here."
        top_menu
    end

    def self.loading_pause
        puts "loading..."
        sleep 0.5
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

    def self.print_invalid_input_message
        linebreak
        puts "=============================================="
        puts "Invalid Input: Reconsider and Try Again"
        puts "=============================================="
        linebreak
        ui_pause
    end

    def self.long_pause
        sleep 3.0
    end

    
end





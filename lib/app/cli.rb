class Cli

    attr_reader :loading_pause, :linebreak, :print_invalid_input_message, :ui_pause, :threebreaks, :loading_pause, :print_welcome_message, :print_top_menu, :print_link_input_menu, :print_tutorial_menu, :print_author_info_menu

    def initialize
        puts "Why are you poking around here, you wanna break somethng?"
        puts self.print_top_menu
        top_menu_select = gets.strip
        top_menu
    end

    #all of the stored visual representations of each of the various menus
    def self.print_welcome_message
        threebreaks
        ui_pause
        puts "========================================"
        linebreak
        puts "Welcome to Brief Bon Ap Listicle Scraper"
        linebreak
        puts "========================================"
        puts "=============== V 0.0.1 ================"
        ui_pause
        threebreaks
        puts "========================================"
        puts "    Press any key & enter to continue   "
        puts "========================================"
        ui_pause
    end

    def self.print_top_menu
        puts "============== Top Menu ================"
        puts "========================================"
        linebreak
        puts "          1. Link Input Menu            "
        puts "          2. Function / Tutorial        "
        puts "          3. About the Author           "
        Cli.linebreak
        puts "========================================"
        puts "========================================"
        ui_pause
        threebreaks
        puts "  Press the corresponding # & enter...  "
        ui_pause
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
    end

    def self.print_tutorial_menu
        "Here lies the tutorial I will type at the end, because its too damn early"
    end

    def self.print_author_info_menu
        ui_pause
        threebreaks
        puts "======================================================"       
        puts " Brief Bon Ap Listicle Scraper by: Horacio Velvetine. "
        ui_pause
        puts "Find Me on GitHub: https://github.com/horaciovelvetine"
        ui_pause
        puts "======================= or ==========================="
        ui_pause
        puts "     Twitter @ https://twitter.com/JamesTi25618261    "
        puts "======================================================" 
        threebreaks
        long_pause
        puts "          Press any key & enter to continue           "
        linebreak
    end





    #Formatting elements to help pretty up the CLI and make the app more User Friendly
    def self.loading_pause
        puts "loading..."
        sleep 0.5
    end

    def self.loading_finish
        puts "Loading Complete! List incoming"
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





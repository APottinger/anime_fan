require_relative "./anime_fan"

class AnimeFan::CLI  
    
    def call
        start
    end

    def list
        #lists anime
        puts ""
        puts "Recent Releases!"
        puts ""
        AnimeFan::Scraper.list
        #pulls 20 newest recent releases
        puts ""
    end

    def action
        puts ""
        puts "Enter list to see shows."
        input = gets.strip
        list if input == "list"  
    end


    def start
        action
        puts ""
        puts "Enter exit to end the program."
        puts ""
        bye
    end

    def bye 
        puts "See you soon!"
    end



  

end



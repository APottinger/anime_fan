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
    end

    def start
        list 
        input = nil
        while input != "exit"
            puts ""
            puts "What new show would you like to watch?"
            puts ""
            puts "Enter list to see shows again."
            puts "Enter exit to end the program."
            puts ""
            input = gets.strip
            if input == "list"
                list 
            elsif 
                
                AnimeFan::Scraper.find_by_title(title)

            end 
        end


        puts "See you soon!"


    end 

end



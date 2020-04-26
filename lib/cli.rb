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


    def start
        list 
        input = nil
        while input != "exit"
            puts ""
            puts "What new show would you like to watch?"
            puts ""
            input = gets.strip
            if input 
                AnimeFan::Scraper.find_by_title(input)
            end
            
            puts "Enter list to see shows again."
            puts "Enter exit to end the program."
            puts ""
            input = gets.strip
            if input == "list"
                list 
            elsif 

                AnimeFan::Scraper.find_by_title(input)

            end 
        end


        puts "See you soon!"


    end 

end



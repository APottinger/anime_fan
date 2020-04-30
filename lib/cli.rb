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
        AnimeFan::Show.all.each.with_index do |s, i|
            puts "#{i+1}. #{s.title}"
        end 

        #pulls 20 newest recent releases
        puts ""
    end

    def action
        puts "Grabbing info..."
        puts ""
        AnimeFan::Scraper.scrape_web
        puts "Enter list to see shows."
        input = gets.strip
        list if input == "list" 
     
    end


    def start
        action
        puts ""
        puts "Enter exit to end the program."
        input = gets.strip 
        if input == "exit"
            bye 
        else
            list
        end

        
    
    end

    def bye 
        puts "See you soon!"
    end



  

end



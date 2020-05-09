class AnimeFan::CLI  
    
    def call 
        start
    end

    def start
        action
        sleep(1)
        choose_anime
    end

    def action
        puts ""
        puts "Welcome to the recent releases Anime Hub!"
        puts ""
        puts "One second while we grab your info..."
        sleep(1)
        puts ""
        puts ""
        puts ""
        list_loop
    end

    def choose_anime
        list 
        user_input 
    end


    private

    def list_loop
        AnimeFan::Scraper.scrape_web
        loop do 
            puts "Enter 'list' to see shows:"
            input = gets.strip
            break if input == "list" 
         end 
    end

    def user_input
        puts "Please choose an anime show by number or search by name otherwise type 'exit' to go to close Anime Hub"
        input = gets.strip
        case input
        when 'exit'
            bye
        else                        
            if valid?(input.to_i)

                show = get_show(input.to_i)
                AnimeFan::Scraper.get_more_info(show) if !show.description 
                display_show(show)
                choose_anime           
            elsif input
                show = AnimeFan::Show.find_by_title(input)
                if show == nil
                    puts "Not Found"
                else
                    AnimeFan::Scraper.get_more_info(show) if !show.description
                    display_show(show)
                end 
                choose_anime
            else
                puts "umm... that doesn't make sense"
                choose_anime                                                
            end
        end
    end

    def list_loop
        AnimeFan::Scraper.scrape_web
        loop do 
            puts "Enter 'list' to see shows:"
            input = gets.strip
            break if input == "list" 
         end 
    end

    def bye 
        puts ""
        puts ""
        puts ""
        puts "See you soon!"
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

    def valid?(input)
        return input.between?(1, AnimeFan::Show.all.size)
    end

    def get_show(i)
        return AnimeFan::Show.all[i-1]
    end

    def display_show(show)
        puts show.description
        puts ""
        puts show.title
        puts show.episode
        puts "press any key when done." #user experience
        gets
    end 
end



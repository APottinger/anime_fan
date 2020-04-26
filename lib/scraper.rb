require_relative "./anime_fan"
require 'open-uri'
require 'nokogiri'
require 'pry'

class AnimeFan::Scraper 

    url = "https://www18.gogoanime.io/"
    html = open("https://www18.gogoanime.io/") 
    doc = Nokogiri::HTML(html)
    animes = []

    def self.scrape_web
        per_page = animes.count
        #create a pagination for the data scraped


        
        page = 1
        last_page = 20
            #class method that scrapes the web page and provides data based on the recent releases of anime
            #data will include title, url link to recent release, ...
        while page <= last_page #pagination, I have in mind to keep it infinite "?"
            p_url = "https://www18.gogoanime.io/?page=#{page}"
            puts p_url
            puts "Page: #{page}"
            puts ""
            p_html = open(p_url)
            p_doc = Nokogiri::HTML(p_html)
            p_recent_release = p_doc.css("div.img")
            p_recent_release.each do |recent_release|
                    
           
                #iterator: iterates over each 'instance' of anime release and pulls the following data in hash format
                anime = {

                    title: p_doc.css("p.name").text,
                    episode: p_doc.css("p.episode").text
                    
                }
        
           
                animes << anime
                puts "Added #{anime[:title]}"
                puts ""
            end

            page += 1

        end
    end
 
    def self.list
        url = "https://www18.gogoanime.io/"
        html = open("https://www18.gogoanime.io/") 
        doc = Nokogiri::HTML(html)
        print doc.css("p.name").text
    end 

    def self.find_by_title(title)
        self.animes.detect do |title|
          anime[:title].downcase.strip == title.downcase.strip ||
          anime[:title].split("(").first.strip.downcase == title.downcase.strip
        end
      end

        

       


   
end


    
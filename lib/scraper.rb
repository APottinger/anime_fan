require_relative "./anime_fan"
require 'open-uri'
require 'nokogiri'
require 'pry'

class AnimeFan::Scraper 

    url = "https://www18.gogoanime.io/"
    html = open("https://www18.gogoanime.io/") 
    doc = Nokogiri::HTML(html)

    def self.scrape_web
        #create a pagination for the data scraped
        page = 1
        last_page = 1
            #class method that scrapes the web page and provides data based on the recent releases of anime
            #data will include title, url link to recent release, ...
        while page <= last_page 
            p_url = "https://www18.gogoanime.io/?page=#{page}"

            p_html = open(p_url)
            p_doc = Nokogiri::HTML(p_html)
            p_recent_release = p_doc.css("ul.items li")
            #binding.pry 
            p_recent_release.each do |recent_release|
                anime = {
                    title: recent_release.css("p.name").text,
                    episode: recent_release.css("p.episode").text,
                    url: recent_release.css("a")[0]["href"]
                }
                #binding.pry 
                 AnimeFan::Show.new(anime[:title], anime[:episode], anime[:url])   
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
        p_url = "https://www18.gogoanime.io"
        p_html = open(p_url)
        p_doc = Nokogiri::HTML(p_html)
        title = p_doc.css("p.name").text
        self.all.detect do |title|
          anime[:title].downcase.strip == title.downcase.strip ||
          anime[:title].split("(").first.strip.downcase == title.downcase.strip
        end
     
      end

        


       


   
end
 

    
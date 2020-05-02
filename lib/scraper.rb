require_relative "./anime_fan"
require 'open-uri'
require 'nokogiri'
require 'pry'

class AnimeFan::Scraper 

    BASE_URL = "https://www18.gogoanime.io/"


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

    def self.get_more_info(show)
        show_html = Nokogiri::HTML(open(BASE_URL + show.url))
        next_url = show_html.css("div.anime-info a")[0]["href"]
        desc_page_html = Nokogiri::HTML(open(BASE_URL + next_url))
        desc_p_tag = desc_page_html.css("p.type")[1].text
        show.description = desc_p_tag

    end

   
end
 

    
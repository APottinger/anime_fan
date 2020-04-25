require_relative "./anime_fan"
require 'open-uri'
require 'nokogiri'
require 'pry'

class AnimeFan::Scraper 

    url = "https://www18.gogoanime.io/"
    html = open("https://www18.gogoanime.io/") 
    doc = Nokogiri::HTML(html)
    
    attr_accessor :url
    
    def self.recent_release
        
        #a method that scrapes the website and returns data that provides information regarding each show in the recent release "directory"
        doc.css("div.img")
        binding.pry
    end 




end 


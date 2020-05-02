require_relative "./anime_fan"
require_relative "../lib/concerns/findable"

class AnimeFan::Show 
    extend Concerns::Findable
    include Concerns::Savable

    #class that holds and manages data about my favorite shows

    @@animes = []

    def self.all 
        @@animes
    end 

    attr_accessor :title, :episode, :url, :description


    def add_show(title)
        title.show = self unless title.show == self
        save
    end

    def initialize(title, episode, url)
        @title, @episode, @url = title, episode, url 
        save 
    end


end





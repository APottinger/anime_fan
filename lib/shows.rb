require_relative "./anime_fan"
require_relative "../concerns/findable"

class AnimeFan::Shows 
    extend Concerns::Findable
    include Concerns::Savable

    #class that holds and manages data about my favorite shows

    @@all = []

    def self.all 
        @@all
    end 

    attr_accessor :title


    def add_show(title)
        title.show = self unless title.show == self
        save
    end

    def initialize(name)
        super(name)
        @title = title
        save 
    end


end





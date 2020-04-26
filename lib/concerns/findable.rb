module Concerns

    module Savable
  
        def initialize(title)
          self.title = title
        end
    
        def save
          self.class.all << self
        end

    end
    
 
    

    module Findable
       
  
        def find_by_title(title)
            self.all.find{|instance| instance.title == title}
        end

        def create(title)
            new_instance = self.new(title)
            new_instance.save
            new_instance
        end
  
        def find_or_create_by_title(title)
            anime = find_by_title(title)
            anime.nil? create(title)
        end

  
        def destroy_all
            self.all.clear
        end
  
  
    end
  
  
end
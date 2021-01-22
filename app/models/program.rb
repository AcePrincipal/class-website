class Program < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :seats
    validates :num_of_seats, numericality: { only_integer: true }
    
    def students
        self.seats.map{|seat| seat.user}
    end

    # def category=(cat)
    #     self.category = cat 
    # end 

    # def category
    #     self.category
    # end 
end

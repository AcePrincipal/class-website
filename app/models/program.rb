class Program < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :seats
    
    def students
        self.seats.map{|seat| seat.user}
    end
end

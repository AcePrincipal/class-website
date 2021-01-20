class User < ApplicationRecord
    has_many :programs
    has_many :categories, through: :programs
    has_many :seats 

    def program_seats 
        self.seats.map{|seat| seat.program }
    end
end

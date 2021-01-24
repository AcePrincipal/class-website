class Program < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :seats
    # accepts_nested_attributes_for :category
    validates :num_of_seats, numericality: { only_integer: true }

    scope :open_seat_programs, -> { where("num_of_seats > seats_taken") }
    
    def students
        self.seats.map{|seat| seat.user}
    end

    def add_seat(user)  
        if self.seats_taken < self.num_of_seats
            seat = Seat.new(snum: (self.seats_taken + 1), user_id: user.id, program_id: self.id)
            seat.save 
            self.seats_taken += 1 
            self.save 
  
            return true
        else
            return false
        end 
    end

    def category_attributes=(attr)
        # byebug
        if !self.category
            self.category = Category.find_or_create_by(attr)
        end 
    end 

    def category_attributes
        self.category.cat 
    end 
end

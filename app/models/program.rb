class Program < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :seats
    # accepts_nested_attributes_for :category
    validates :num_of_seats, numericality: { only_integer: true }
    
    def students
        self.seats.map{|seat| seat.user}
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

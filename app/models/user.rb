class User < ApplicationRecord
    has_many :programs
    has_many :categories, through: :programs
    has_many :seats 
    has_secure_password
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true 
    validates :password, presence: true 

    def program_seats 
        self.seats.map{|seat| seat.program }
    end
end

class User < ApplicationRecord
    has_many :programs
    has_many :categories, through: :programs
    has_many :seats 
    has_secure_password
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true 

    def program_seats 
        self.seats.map{|seat| seat.program }
    end

    def self.create_from_omniauth(auth)
        self.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
            hash = {username: auth['info']['name'], email: auth['info']['email'], password: SecureRandom.hex(16)}
            
            u.update(hash)
        end
    end
end

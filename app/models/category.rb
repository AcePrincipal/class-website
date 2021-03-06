class Category < ApplicationRecord
    has_many :programs
    has_many :users, through: :programs
    validates :cat, presence: true
end

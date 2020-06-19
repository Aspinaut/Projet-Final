class School < ApplicationRecord
  has_many :trainings
  belongs_to :user 
end

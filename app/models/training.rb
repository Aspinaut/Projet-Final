class Training < ApplicationRecord
  belongs_to :school
  has_many :comments
  has_many :sessions
  has_many :programs
end

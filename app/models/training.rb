class Training < ApplicationRecord
  belongs_to :school
  has_many :comments, :programs, :sessions
end

class Training < ApplicationRecord
  belongs_to :school
  has_many :comments
  has_many :sessions
  has_many :programs

  acts_as_taggable_on :tags

  $modes = ["à distance", "présentiel", "à distance et en alternance", "à distance ou présentiel"]
  $durations = ["1-10", "11-20", "21-30", "31-40", "41+"]
  $prices = [ "0-1000", "1001-2000", "2001-3000", "3001-4000", "4000+"]

end

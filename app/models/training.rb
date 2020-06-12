class Training < ApplicationRecord
  belongs_to :school
  has_many :comments
  has_many :sessions
  has_many :programs

  acts_as_taggable_on :tags
  $modes = ["remote", "onsite", "remote or onsite", "remote-alternance"]
  $durations = ["1", "10", "12", "13", "9", "24", "4", "36", "48"]
  # def filter_by_mode
  #
  # end
  #
  # def filter_by_location
  #
  # end
  #
  # def filter_by_language
  #
  # end
  #
  # def filter_by_price
  #
  # end

end

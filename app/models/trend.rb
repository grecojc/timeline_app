class Trend < ActiveRecord::Base
  	has_and_belongs_to_many :tweets

end
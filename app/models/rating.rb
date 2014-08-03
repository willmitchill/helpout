class Rating < ActiveRecord::Base
  belongs_to :user
  validates :score, numericality: { only_integer: true, minimum: 1 }
end

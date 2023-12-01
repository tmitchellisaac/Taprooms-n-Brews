class Taproom < ApplicationRecord
  has_many :beers, dependent: :destroy
end
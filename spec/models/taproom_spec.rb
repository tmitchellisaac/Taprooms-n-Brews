require 'rails_helper'

RSpec.describe Taproom do
  it {should have_many :beers}
end
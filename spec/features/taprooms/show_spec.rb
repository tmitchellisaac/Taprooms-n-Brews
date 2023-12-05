
require 'rails_helper'

RSpec.describe "taproom index page", type: :feature do
  before(:each) do
    @call_to_arms = Taproom.create!(name: "Call to Arms Brewing", 
      address: "4526 Tennyson St, Denver CO 80212", 
      website: "calltoarmsbrewing.com", 
      phone_number: "720-328-8258", 
      established: "2014", 
      number_of_employees: 7, 
      serving_capacity: 90, 
      offers_food: false)

    @ratio = Taproom.create!(name: "Ratio Beerworks", 
      address: "2920 Larimer St, Denver, CO 80205", 
      website: "ratiobeerworks.com", 
      phone_number: "303-997-8288", 
      established: "2014", 
      number_of_employees: 12, 
      serving_capacity: 100, 
      offers_food: false)
  end 


  describe "show taproom page" do
    it "When I visit '/taproom/:id' I see each taproom and its attributes" do

      # As a visitor
      # When I visit '/parents/:id'
      # Then I see the parent with that id including the parent's attributes
      # (data from each column that is on the parent table)

      visit "/taprooms/#{@call_to_arms.id}"

      expect(page).to have_content(@call_to_arms.name)
      expect(page).to have_content(@call_to_arms.address)
      expect(page).to have_content(@call_to_arms.website)
      expect(page).to have_content(@call_to_arms.phone_number)
      expect(page).to have_content(@call_to_arms.established)
      expect(page).to have_content(@call_to_arms.number_of_employees)
      expect(page).to have_content(@call_to_arms.serving_capacity)
      # expect(page).to have_content("Serves Food").or("No Food Offered")


      visit "/taprooms/#{@ratio.id}"

      expect(page).to have_content(@ratio.name)
      expect(page).to have_content(@ratio.address)
      expect(page).to have_content(@ratio.website)
      expect(page).to have_content(@ratio.phone_number)
      expect(page).to have_content(@ratio.established)
      expect(page).to have_content(@ratio.number_of_employees)
      expect(page).to have_content(@ratio.serving_capacity)
      # expect(page).to have_content(@ratio.offers_food)
    end
  end

  describe "shows a count of beers on a taproom's show page" do
    it "has a count of beers" do
      # As a visitor
      # When I visit a parent's show page
      # I see a count of the number of children associated with this parent
     
      visit "/taprooms/#{@ratio.id}"

      expect(page).to have_content(@ratio.beers.length)
      
    end
  end

  describe "delete a taproom" do
    it "has a link to delete a taproom" do
      visit "/taprooms/#{@ratio.id}"
      
      click_button "Delete Taproom"
      
      expect(page).to have_no_content("Ratio Beerworks")
    end
  end

end
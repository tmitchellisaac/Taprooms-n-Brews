
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

    @cerebral = Taproom.create!(name: "Cerebral Brewing", 
      address: "1477 Monroe St, Denver, CO 80206", 
      website: "cerebralbrewing.com", 
      phone_number: "303-865-7341", 
      established: "2015", 
      number_of_employees: 8, 
      serving_capacity: 70, 
      offers_food: false)
    
    @dbc = Taproom.create!(name: "Denver Beer Co", 
      address: "1695 Platte St, Denver, CO 80202", 
      website: "denverbeerco.com", 
      phone_number: "720-279-8247", 
      established: "2011", 
      number_of_employees: 15, 
      serving_capacity: 150, 
      offers_food: false)

    @hogshead = Taproom.create!(name: "Hogshead Brewing", 
      address: "4460 West 29th Ave, Denver, CO 80212", 
      website: "hogshead54.com", 
      phone_number: "303-495-3105", 
      established: "2012", 
      number_of_employees: 6, 
      serving_capacity: 45, 
      offers_food: true)
       
    @cta_ipa = @call_to_arms.beers.create!(name: "CTA IPA",
      style: "Denver IPA", 
      medal_winner: false, 
      abv: 6.5, 
      price: 700)
    @chinwag = @hogshead.beers.create!(name: "Chin Wag", 
      style: "Extra Special Bitter", 
      medal_winner: false, 
      abv: 6.5, 
      price: 750)
    @princess_yum_yum = @dbc.beers.create!(name: "Princess Yum Yum", 
      style: "Raspberry Kolsch", 
      medal_winner: true, 
      abv: 4.8, 
      price: 650)
    @rare_trait = @cerebral.beers.create!(name: "Rare Trait", 
      style: "IPA", 
      medal_winner: false, 
      abv: 6.4, 
      price: 800)
    @king_of_carrot_flowers = @ratio.beers.create!(name: "King of Carrot Flowers", 
      style: "Carrot and Elderflower Saison", 
      medal_winner: false, 
      abv: 5.9, 
      price: 800)
  end

  it "can see all taprooms and their attributes" do
    # User Story 1, Parent Index
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system

    #arrange // given
  
    #act// when
    visit "/taprooms"

    #assert// then
    expect(page).to have_content(@call_to_arms.name)
    expect(page).to have_content(@ratio.name)
  end

  describe "sort taproom index by created_by attribute" do
    it "sorts by create_by" do
      # User Story 6, Parent Index sorted by Most Recently Created
      # As a visitor
      # When I visit the parent index,
      # I see that records are ordered by most recently created first
      # And next to each of the records I see when it was created
      visit "/taprooms"

      expect(@call_to_arms.name).to appear_before(@ratio.name)

      expect(page).to have_content(@call_to_arms.created_at)
      expect(page).to have_content(@ratio.created_at)
    end
  end


  describe "parent index located at the top of every page" do
    it "has a parent index link on top of every page" do
      # User Story 9, Parent Index Link
      # As a visitor
      # When I visit any page on the site
      # Then I see a link at the top of the page that takes me to the Parent Index
    visit "/"
    expect(page).to have_link("Taprooms", :href=>'/taprooms')

    visit "/beers"
    expect(page).to have_link("Taproom List", :href=>'/taprooms')

    visit "/taprooms/#{@ratio.id}"
    expect(page).to have_link("Taproom List", :href=>'/taprooms')

    visit "/beers/#{@rare_trait.id}"
    expect(page).to have_link("Taproom List", :href=>'/taprooms')

    visit "/taprooms/#{@dbc.id}/beers"
    expect(page).to have_link("Taproom List", :href=>'/taprooms')
    end 
  end

  describe "link to taproom edit page next to each taproom on index page" do
    it " see above" do
      # User Story 17, Parent Update From Parent Index Page 
      # As a visitor
      # When I visit the parent index page
      # Next to every parent, I see a link to edit that parent's info
      # When I click the link
      # I should be taken to that parent's edit page where I can update its information just like in User Story 12

      visit "/taprooms"

      expect(page).to have_link("Edit Taproom", :href=>"/taprooms/#{@ratio.id}/edit")
      expect(page).to have_link("Edit Taproom", :href=>"/taprooms/#{@dbc.id}/edit")
      expect(page).to have_link("Edit Taproom", :href=>"/taprooms/#{@hogshead.id}/edit")
      expect(page).to have_link("Edit Taproom", :href=>"/taprooms/#{@cerebral.id}/edit")
    end
  end
  
end
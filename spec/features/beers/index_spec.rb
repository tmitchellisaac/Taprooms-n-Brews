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


  describe "child index located at the top of every page" do
    it "has a child index link on top of every page" do
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
    visit "/"
    expect(page).to have_link("Beers", :href=>'/beers')

    visit "/taprooms"
    expect(page).to have_link("Full Beer List", :href=>'/beers')

    visit "/taprooms/#{@ratio.id}"
    expect(page).to have_link("Full Beer List", :href=>'/beers')

    visit "/beers/#{@rare_trait.id}"
    expect(page).to have_link("Full Beer List", :href=>'/beers')

    visit "/taprooms/#{@dbc.id}/beers"
    expect(page).to have_link("Full Beer List", :href=>'/beers')
    end 
  end

  describe "when visit taproom show page there is a link to beers table name page" do
    it "has a child table name page linked on the taproom page" do
      # As a visitor
      # When I visit a parent show page ('/parents/:id')
      # Then I see a link to take me to that parent's 
      # `child_table_name` page ('/parents/:id/child_table_name')
      visit "/taprooms/#{@ratio.id}"
      expect(page).to have_link("Beers Offered", :href=>"/taprooms/#{@ratio.id}/beers")

      visit "/taprooms/#{@hogshead.id}"
      expect(page).to have_link("Beers Offered", :href=>"/taprooms/#{@hogshead.id}/beers")
    end
  end




end
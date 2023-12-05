require 'rails_helper'

RSpec.describe "beers of a taproom" do
  it "show the name of each beer offered at a taproom" do
    # User Story 5, Parent Children Index
    # As a visitor
    # When I visit '/parents/:parent_id/child_table_name'
    # Then I see each Child that is associated with that Parent with each Child's attributes
    # (data from each column that is on the child table)
   
    call_to_arms = Taproom.create!(name: "Call to Arms Brewing", address: "4526 Tennyson St, Denver CO 80212", website: "calltoarmsbrewing.com", phone_number: "720-328-8258", established: "2014", number_of_employees: 7, serving_capacity: 90, offers_food: false)
    ballroom = call_to_arms.beers.create!(name: "Ballroom Beer", style: "American Light Lager", medal_winner: false, abv: 5.0, price: 500)
    janet_reno = call_to_arms.beers.create!(name: "Janet Reno's Dance Party", style: "Hazy IPA", medal_winner: false, abv: 7.0, price: 700)

    visit "/taprooms/#{call_to_arms.id}/beers"

    expect(page).to have_content(ballroom.name)
    expect(page).to have_content(janet_reno.name)
  end

  it "shows the attributes of each beer" do
    #User Story 5 continued

    call_to_arms = Taproom.create!(name: "Call to Arms Brewing", address: "4526 Tennyson St, Denver CO 80212", website: "calltoarmsbrewing.com", phone_number: "720-328-8258", established: "2014", number_of_employees: 7, serving_capacity: 90, offers_food: false)
    ballroom = call_to_arms.beers.create!(name: "Ballroom Beer", style: "American Light Lager", medal_winner: false, abv: 5.0, price: 550)
    janet_reno = call_to_arms.beers.create!(name: "Janet Reno's Dance Party", style: "Hazy IPA", medal_winner: false, abv: 7.0, price: 770)

    visit "/taprooms/#{call_to_arms.id}/beers"

    expect(page).to have_content("Ballroom Beer")
    expect(page).to have_content("American Light Lager")
    expect(page).to have_content(5.0)
    expect(page).to have_content(5.50)
    expect(page).to have_content("Janet Reno's Dance Party")
    expect(page).to have_content("Hazy IPA")
    expect(page).to have_content(7.70)
    expect(page).to have_content(7.0)
  end

  it "has a delete button next to each beer, when clicked it deletes and returns to /beers" do
    # User Story 23, Child Delete From Childs Index Page 
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to delete that child
    # When I click the link
    # I should be taken to the `child_table_name` index page where I no longer see that child
    call_to_arms = Taproom.create!(name: "Call to Arms Brewing", address: "4526 Tennyson St, Denver CO 80212", website: "calltoarmsbrewing.com", phone_number: "720-328-8258", established: "2014", number_of_employees: 7, serving_capacity: 90, offers_food: false)
    ballroom = call_to_arms.beers.create!(name: "Ballroom Beer", style: "American Light Lager", medal_winner: false, abv: 5.0, price: 500)
    janet_reno = call_to_arms.beers.create!(name: "Janet Reno's Dance Party", style: "Hazy IPA", medal_winner: false, abv: 7.0, price: 700)

    visit "/taprooms/#{call_to_arms.id}/beers"

    expect(page).to have_content("Ballroom Beer")

    click_button "Delete #{ballroom.name}"

    expect(page).to have_no_content("Ballroom Beer")
  end

  describe "alphabetize taproom/:id/beers index page" do
    it "alphabetizes the beer list on a taproom/:id/beer page" do
      # User Story 16, Sort Parent's Children in Alphabetical Order by name 
      # As a visitor
      # When I visit the Parent's children Index Page
      # Then I see a link to sort children in alphabetical order
      # When I click on the link
      # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order

      ratio = Taproom.create!(name: "Ratio Beerworks", 
        address: "2920 Larimer St, Denver, CO 80205", 
        website: "ratiobeerworks.com", 
        phone_number: "303-997-8288", 
        established: "2014", 
        number_of_employees: 12, 
        serving_capacity: 100, 
        offers_food: false)

      domestica = ratio.beers.create!(name: "Domestica", 
        style: "American Golden Ale", 
        medal_winner: false, 
        abv: 4.9, price: 650)

      cityscapes = ratio.beers.create!(name: "Cityscapes", 
        style: "Mexican Lager", 
        medal_winner: false, 
        abv: 4.8, 
        price: 650)

      antidote = ratio.beers.create!(name: "Antidote", 
        style: "West Coast IPA", 
        medal_winner: false, 
        abv: 7.0, 
        price: 700)

      king_of_carrot_flowers = ratio.beers.create!(name: "King of Carrot Flowers", 
        style: "Carrot and Elderflower Saison", 
        medal_winner: 
        false, 
        abv: 5.9, 
        price: 800)

      hold_steady = ratio.beers.create!(name: "Hold Steady", 
        style: "Dark Scotch Ale", 
        medal_winner: false, 
        abv: 7.5, 
        price: 800)

      visit "/taprooms/#{ratio.id}/beers"
      expect("Domestica").to appear_before("Antidote")

      click_link("Alphabetize List")
      expect("Antidote").to appear_before("Cityscapes")
      expect("Cityscapes").to appear_before("Domestica")
      expect("Domestica").to appear_before("Hold Steady")
      expect("Hold Steady").to appear_before("King of Carrot Flowers")
    end
  end

  it "has a link to update a beer on the taprooms/taproom.id/beers page" do
    # User Story 18, Child Update From Childs Index Page 
    # part 2
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to edit that child's info
    # When I click the link
    # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 14
    
    ratio = Taproom.create!(name: "Ratio Beerworks", 
      address: "2920 Larimer St, Denver, CO 80205", 
      website: "ratiobeerworks.com", 
      phone_number: "303-997-8288", 
      established: "2014", 
      number_of_employees: 12, 
      serving_capacity: 100, 
      offers_food: false)

    domestica = ratio.beers.create!(name: "Domestica", 
      style: "American Golden Ale", 
      medal_winner: false, 
      abv: 4.9, price: 650)

    cityscapes = ratio.beers.create!(name: "Cityscapes", 
      style: "Mexican Lager", 
      medal_winner: false, 
      abv: 4.8, 
      price: 650)

    antidote = ratio.beers.create!(name: "Antidote", 
      style: "West Coast IPA", 
      medal_winner: false, 
      abv: 7.0, 
      price: 700)

    king_of_carrot_flowers = ratio.beers.create!(name: "King of Carrot Flowers", 
      style: "Carrot and Elderflower Saison", 
      medal_winner: 
      false, 
      abv: 5.9, 
      price: 800)

    hold_steady = ratio.beers.create!(name: "Hold Steady", 
      style: "Dark Scotch Ale", 
      medal_winner: false, 
      abv: 7.5, 
      price: 800)

    visit "/taprooms/#{ratio.id}/beers"

    expect(page).to have_link()
  
    expect(page).to have_link("Edit Beer", :href=> "/beers/#{antidote.id}/edit")
    expect(page).to have_link("Edit Beer", :href=> "/beers/#{hold_steady.id}/edit")
    expect(page).to have_link("Edit Beer", :href=> "/beers/#{king_of_carrot_flowers.id}/edit")
    expect(page).to have_link("Edit Beer", :href=> "/beers/#{domestica.id}/edit")

    click_link("Edit Beer", :href=> "/beers/#{antidote.id}/edit")

    expect(page).to have_content("Edit a Beer's Info")

    fill_in"name", with:"Poison"

    click_button("Update Beer Info")
    
    expect(page).to have_content("Poison")
  end
end
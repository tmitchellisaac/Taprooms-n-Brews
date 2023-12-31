require 'rails_helper'

RSpec.describe "taproom index page", type: :feature do
  
  it "has a /beers index page showing all beers and their attributes" do
    # User Story 3, Child Index 
    # As a visitor
    # When I visit '/child_table_name'
    # Then I see each Child in the system including the Child's attributes
    # (data from each column that is on the child table)

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
      price: 870)
    @king_of_carrot_flowers = @ratio.beers.create!(name: "King of Carrot Flowers", 
      style: "Carrot and Elderflower Saison", 
      medal_winner: false, 
      abv: 5.9, 
      price: 800)

    visit "/beers"

    expect(page).to have_content("CTA IPA")
    expect(page).to have_content("Denver IPA")
    expect(page).to have_content(6.5)
    expect(page).to have_content(7.00)

    expect(page).to have_content("King of Carrot Flowers")
    expect(page).to have_content("Carrot and Elderflower Saison")
    expect(page).to have_content(5.9)
    expect(page).to have_content(8.00)

    expect(page).to have_content("Rare Trait")
    expect(page).to have_content("IPA")
    expect(page).to have_content(6.4)
    expect(page).to have_content(8.70)
  end

  

  it "has a child index link on top of every page" do
    # User Story 8, Child Index Link
    # As a visitor
    # When I visit any page on the site
    # Then I see a link at the top of the page that takes me to the Child Index
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

  describe "when visit taproom show page there is a link to beers table name page" do
    it "has a child table name page linked on the taproom page" do
      # As a visitor
      # When I visit a parent show page ('/parents/:id')
      # Then I see a link to take me to that parent's 
      # `child_table_name` page ('/parents/:id/child_table_name')
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
     
      visit "/taprooms/#{@ratio.id}"
      expect(page).to have_link("Beers Offered", :href=>"/taprooms/#{@ratio.id}/beers")

      visit "/taprooms/#{@hogshead.id}"
      expect(page).to have_link("Beers Offered", :href=>"/taprooms/#{@hogshead.id}/beers")
    end
  end

  describe "when I visit the beers index page I see award winners if that value is true" do
    it " displays award winners only for those beers that the value is true" do
      # User Story 15, Child Index only shows `true` Records 
      # As a visitor
      # When I visit the child index
      # Then I only see records where the boolean column is `true`
      
      @dbc = Taproom.create!(name: "Denver Beer Co", 
        address: "1695 Platte St, Denver, CO 80202", 
        website: "denverbeerco.com", 
        phone_number: "720-279-8247", 
        established: "2011", 
        number_of_employees: 15, 
        serving_capacity: 150, 
        offers_food: false)
      
      @ratio = Taproom.create!(name: "Ratio Beerworks", 
        address: "2920 Larimer St, Denver, CO 80205", 
        website: "ratiobeerworks.com", 
        phone_number: "303-997-8288", 
        established: "2014", 
        number_of_employees: 12, 
        serving_capacity: 100, 
        offers_food: false)

      @king_of_carrot_flowers = @ratio.beers.create!(name: "King of Carrot Flowers", 
        style: "Carrot and Elderflower Saison", 
        medal_winner: false, 
        abv: 5.9, 
        price: 800)
      
      visit "/beers"
      expect(page).to have_no_content("Award Winner")

      @princess_yum_yum = @dbc.beers.create!(name: "Princess Yum Yum", 
        style: "Raspberry Kolsch", 
        medal_winner: true, 
        abv: 4.8, 
        price: 650)

      visit "/beers"
      expect(page).to have_content("Award Winner")
    end
  end

  describe "edit link on index page" do
    it "has a link to the edit a beer page next to every beer" do
      # User Story 18, Child Update From Childs Index Page 
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

      visit "/beers"

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


  it "has a link to the beer's show page next to each beer" do
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

    visit "/beers"

    click_link("Beer's Page", :href=>"/beers/#{antidote.id}")

    expect(page).to have_content("Antidote")
    expect(page).to have_content("West Coast IPA")
    expect(page).to have_content(7.00)
  end

  it "has a link next to each taproom that will delete the taproom and redirect to taproom index page" do
    # User Story 22, Parent Delete From Parent Index Page 
      # As a visitor
      # When I visit the parent index page
      # Next to every parent, I see a link to delete that parent
      # When I click the link
      # I am returned to the Parent Index Page where I no longer see that parent
    
    @dbc = Taproom.create!(name: "Denver Beer Co", 
        address: "1695 Platte St, Denver, CO 80202", 
        website: "denverbeerco.com", 
        phone_number: "720-279-8247", 
        established: "2011", 
        number_of_employees: 15, 
        serving_capacity: 150, 
        offers_food: false)
    
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
    visit "/taprooms"

    expect(page).to have_content("Ratio Beerworks")

    click_button "Delete #{ratio.name}"

    expect(page)
  end

  it "has button to delete beer from the /beers index page and redirects back to /beers" do
    #User Story 23, Child Delete From Childs Index Page 
    # As a visitor
    # When I visit the `child_table_name` index page or a parent `child_table_name` index page
    # Next to every child, I see a link to delete that child
    # When I click the link
    # I should be taken to the `child_table_name` index page where I no longer see that child
    
    @dbc = Taproom.create!(name: "Denver Beer Co", 
        address: "1695 Platte St, Denver, CO 80202", 
        website: "denverbeerco.com", 
        phone_number: "720-279-8247", 
        established: "2011", 
        number_of_employees: 15, 
        serving_capacity: 150, 
        offers_food: false)
    
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

    visit "/beers"

    expect(page).to have_content("Antidote")

    click_button("Delete #{antidote.name}")

    expect(page).to have_no_content("Antidote")
  end
end

require 'rails_helper'

RSpec.describe "taproom index page", type: :feature do
  it "can see all taprooms and their attributes" do

  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system

  #arrange // given

    call_to_arms = Taproom.create!(name: "Call to Arms Brewing", 
                                            address: "4526 Tennyson St, Denver CO 80212", 
                                            website: "calltoarmsbrewing.com", 
                                            phone_number: "720-328-8258", 
                                            established: "2014", 
                                            number_of_employees: 7, 
                                            serving_capacity: 90, 
                                            offers_food: false)
              ratio = Taproom.create!(name: "Ratio Beerworks", 
                                      address: "2920 Larimer St, Denver, CO 80205", 
                                      website: "ratiobeerworks.com", 
                                      phone_number: "303-997-8288", 
                                      established: "2014", 
                                      number_of_employees: 12, 
                                      serving_capacity: 100, 
                                      offers_food: false)
            #act// when

            visit "/taprooms"
            #assert// then
            expect(page).to have_content(call_to_arms.name)

            expect(page).to have_content(ratio.name)
  end

  describe "show taproom page" do
    it "When I visit '/taproom/:id' I see each taproom and its attributes" do

      # As a visitor
      # When I visit '/parents/:id'
      # Then I see the parent with that id including the parent's attributes
      # (data from each column that is on the parent table)
      call_to_arms = Taproom.create!(name: "Call to Arms Brewing", 
                                      address: "4526 Tennyson St, Denver CO 80212", 
                                      website: "calltoarmsbrewing.com", 
                                      phone_number: "720-328-8258", 
                                      established: "2014", 
                                      number_of_employees: 7, 
                                      serving_capacity: 90, 
                                      offers_food: false)
      ratio = Taproom.create!(name: "Ratio Beerworks", 
                              address: "2920 Larimer St, Denver, CO 80205", 
                              website: "ratiobeerworks.com", 
                              phone_number: "303-997-8288", 
                              established: "2014", 
                              number_of_employees: 12, 
                              serving_capacity: 100, 
                              offers_food: false)
    visit "/taprooms/#{call_to_arms.id}"

    expect(page).to have_content(call_to_arms.name)
    expect(page).to have_content(call_to_arms.address)
    expect(page).to have_content(call_to_arms.website)
    expect(page).to have_content(call_to_arms.phone_number)
    expect(page).to have_content(call_to_arms.established)
    expect(page).to have_content(call_to_arms.number_of_employees)
    expect(page).to have_content(call_to_arms.serving_capacity)
    expect(page).to have_content(call_to_arms.offers_food)
  
    visit "/taprooms/#{ratio.id}"

    expect(page).to have_content(ratio.name)
    expect(page).to have_content(ratio.address)
    expect(page).to have_content(ratio.website)
    expect(page).to have_content(ratio.phone_number)
    expect(page).to have_content(ratio.established)
    expect(page).to have_content(ratio.number_of_employees)
    expect(page).to have_content(ratio.serving_capacity)
    expect(page).to have_content(ratio.offers_food)

  end
end

end
require 'rails_helper'


# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

RSpec.describe "beers of a taproom" do
  it "show the name of each beer offered at a taproom" do
    call_to_arms = Taproom.create!(name: "Call to Arms Brewing", address: "4526 Tennyson St, Denver CO 80212", website: "calltoarmsbrewing.com", phone_number: "720-328-8258", established: "2014", number_of_employees: 7, serving_capacity: 90, offers_food: false)
    ballroom = call_to_arms.beers.create!(name: "Ballroom Beer", style: "American Light Lager", medal_winner: false, abv: 5.0, price: 500)
    janet_reno = call_to_arms.beers.create!(name: "Janet Reno's Dance Party", style: "Hazy IPA", medal_winner: false, abv: 7.0, price: 700)

    visit "/taprooms/#{call_to_arms.id}/beers"

    expect(page).to have_content(ballroom.name)
    expect(page).to have_content(janet_reno.name)
  end

  # it "shows the attributes of each beer" do


  # end
end
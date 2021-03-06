require 'spec_helper'

feature "Viewing tickets" do
  before do
    sublime_text_3 = FactoryGirl.create(:project, name: "Sublime Text 3")

    user = FactoryGirl.create(:user)
    ticket = FactoryGirl.create(:ticket,
            project: sublime_text_3,
            title: "Make it shiny!",
            description: "Gradients! Starbursts! Oh my!")
    ticket.update(user: user)

    internet_explorer = FactoryGirl.create(:project, name: "Internet Explorer")

    FactoryGirl.create(:ticket,
            project: internet_explorer,
            title: "Standards compliance",
            description: "Isn't a joke.")

    visit '/'
  end

  scenario "Viewing tickets for a given project" do
    click_link "Sublime Text 3"

    expect(page).to have_content("Make it shiny!")
    expect(page).to_not have_content("Standards compliance")

    click_link "Make it shiny!"
    within("#ticket h2") do
      expect(page).to have_content("Make it shiny!")
    end

    expect(page).to have_content("Gradients! Starbursts! Oh my!")
  end
end
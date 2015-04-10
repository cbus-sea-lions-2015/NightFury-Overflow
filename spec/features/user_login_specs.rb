require 'rails_helper'
require 'capybara/rspec'

feature "User visits page without login in" do
  before :each do
    visit '/logout'
    visit '/'
  end

  scenario "when a user visits the home page the user can see brand and links" do
    expect(page).to have_content("NightFuryOverflow")
    expect(page).to have_link("Recent")
    expect(page).to have_link("Top Voted")
    expect(page).to have_link("Trending")
    expect(page).to have_link("Login")
    expect(page).to have_link("Sign Up")
  end

  scenario "when a user visits the home page the user can see all questions" do
    questions = Questions.pluck(:title)
    questions.each do |question|
      expect(page).to have_link(question)
    end
  end

  scenario "when a user click on the question, can see the answers" do
    # question = Question.first
    # click_link(question.title)
    # expect(page).to redirect_to(question)
  end

end

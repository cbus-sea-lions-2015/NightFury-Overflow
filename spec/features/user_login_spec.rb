require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "User visits page without login in", type: :feature do
  before :each do
    visit '/logout'
  end

  scenario "when a user visits the home page the user can see brand and links" do
    visit '/'
    expect(page).to have_content("NightFuryOverflow")
    expect(page).to have_link("Recent")
    expect(page).to have_link("Top Voted")
    expect(page).to have_link("Trending")
    expect(page).to have_link("Log In")
    expect(page).to have_link("Sign Up")
  end

  scenario "when a user visits the home page the user can see all questions" do
    User.create!(email: "batman@batman.com", password:"batman")
    5.times {Question.create!(title: "Why this title?" , body:"I want to know why this title.", user: User.first) }
    visit '/'
    questions = Question.pluck(:title)
    questions.each do |question|
      expect(page).to have_link(question)
    end
  end

  scenario "when a user click on the question, can see the answers" do
    User.create!(email: "batman@batman.com", password:"batman")
    Question.create!(title: "Why this title?" , body:"I want to know why this title.", user: User.first)
    question = Question.first
    visit '/'
    click_link(question.title)
    expect(page.current_path).to eq("/questions/#{question.id}")
    expect(page).to have_content("Answers")
  end

end

require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #index" do
    it 'shows all quesitons, newest first' do
      5.times {Question.create!(title: "Why this title?" , body:"I want to know why this title.", user: User.first) }
      questions = Question.order(created_at: :desc)
      get :index
      expect(assigns(questions)).to eq(@questions)
    end
  end
  
  describe "GET #show" do
    it 'displays the question' do
      question = Question.create!(title: "Why this title?" , body:"I want to know why this title.", user: User.first)
      get :show, {id: question.id}
      expect(assigns(question)).to eq(@question)
    end
  end


end

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

  describe "GET #new" do
    it 'displays a form for adding question' do
      get :new
      expect(assigns(Question.new)).to eq(@question)
    end
  end

  describe "POST #create" do
  let!(:user) { User.create(email: "batman@batman.com", password:"batman") }
  let(:default_session) { {user_id: user.id} }
    it 'should add a new question' do
      expect { 
        post :create, 
          {question: {
            title: "Why this title?",
            body:"I want to know why this title."
          }},
          default_session
      }.to change(Question, :count).by(1)
    end
  end

end

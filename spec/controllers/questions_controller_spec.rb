require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let!(:user) { User.create(email: "batman@batman.com", password:"batman") }
  let(:default_session) { {user_id: user.id} }

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

  describe "GET #edit" do
    it 'displays a form for editing a question' do
      question = Question.create!(title: "Why this title?",
                                  body:"I want to know why this title.", user: user)
      get :edit, id: question.id
      expect(assigns(Question.find(question.id))).to eq(@question)
    end
  end

  describe "PUT #update" do
    pending
    it 'updates the question and sends you back to show' do
      question = Question.create!(title: "Why this title?",
                                  body:"I want to know why this title.", user: user)
      expect { 
        put :update, {
        id: question, 
        question: { title: "Changed Title", body:"I want to know why this title."}
        }, default_session }.to change{ Question.find(question.id).title }.to("Changed Title")
    end
  end

end

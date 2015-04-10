require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  let!(:user) { User.create(email: "batman@batman.com", password:"batman") }
  let(:default_session) { {user_id: user.id} }

  describe "POST #create" do
    it 'should add a new answer to question' do
      question = Question.create!(title: "Why this title?" , body:"I want to know why this title.", user: user)
      expect {
        post :create,
        { question_id: question.id,
          answer: {
           body:"This is my answer."
        }},
        default_session
      }.to change{ question.answers.count }.by(1)
    end
  end

end

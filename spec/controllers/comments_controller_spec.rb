require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  let!(:user) { User.create(email: "dan@dan.dan", password:"1234") }
  let!(:question) { Question.create(title: "Whatup", body: "Sup dawg", user: user)}
  let!(:answer) { Answer.create(body: "Nahmmuch", question: question, user: user)}
  let!(:comment) { answer.comments.create(body: "bloah", user: user) }
  let(:default_session) { {user_id: user.id} }


  describe "POST#create" do
    context "question comment" do
      it "creates a new comment to the question" do
        expect {
          post :create,
          {
            comment: { body: "Blach blach" },
            question_id: question.id
          },
          default_session
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the question page" do
        post :create,
        {
          comment: { body: "Blach blach" },
          question_id: question.id
        },
        default_session
        expect(response).to redirect_to(question)
      end
    end

    context "question answer comment" do
      it "creates a new comment to the answer" do
        expect {
          post :create,
          {
            comment: { body: "Blach blach" },
            question_id: question.id,
            answer_id: answer.id
          },
          default_session
        }.to change(Comment, :count).by(1)
      end

      it "redirects to the question page" do
        post :create,
        {
          comment: { body: "Blach blach" },
          question_id: question.id,
          answer_id: answer.id
        },
        default_session
        expect(response).to redirect_to(question)
      end

    end

  end

  describe "DELETE#destroy" do
    context "question comment" do
      it "deletes the question comment" do
        comment = question.comments.create(body: "bloah", user: user)
        expect {
          delete :destroy,
          {
            question_id: question.id,
            id: comment.id
          },
          default_session
        }.to change(Comment, :count).by(-1)
      end

      it "redirects to the question page" do
        delete :destroy,
        {
          question_id: question.id,
          id: comment.id
        },
        default_session
        expect(response).to redirect_to(question)
      end

    end

    context "question's answer comment" do
      it "deletes the question's answer comment" do
        expect {
          delete :destroy,
          {
            question_id: question.id,
            answer_id: answer.id,
            id: comment.id
          },
          default_session
        }.to change(Comment, :count).by(-1)
      end

      it "redirects to the question page" do
        delete :destroy,
        {
          question_id: question.id,
          answer_id: answer.id,
          id: comment.id
        },
        default_session
        expect(response).to redirect_to(question)
      end

    end

  end

end

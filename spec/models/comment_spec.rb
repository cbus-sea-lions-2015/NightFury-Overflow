require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { User.create(email: "dan@dan.dan", password:"1234") }
  let!(:question) { Question.create(title: "Whatup", body: "Sup dawg", user: user)}
  let!(:answer) { Answer.create(body: "Nahmmuch", question: question, user: user)}
  let!(:comment) { answer.comments.create(body: "bloah", user: user) }

  it "is a comment" do
    expect(comment).to be_a Comment
  end

  it "has a body" do
    expect(comment.body).not_to be nil
  end

  it "belongs to a user" do
    expect(comment.user).not_to be nil
  end

  it "belongs to a commentable object" do
    expect(comment.commentable).not_to be nil
  end

end

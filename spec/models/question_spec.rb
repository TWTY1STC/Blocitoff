require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) {Question.create!(title: "New Question Title", body: "New Question Body")}

  describe "attributes" do
      it "responds to title" do
          expect(question).to respond_to(:title)
      end
      
      it "responds to body" do
          expect(question).to respond_to(:body)
      end
      
      it "responds to resolved as a boolean" do
        expect(question.resolved).to be_in([true, false])
    end
  end
end
  

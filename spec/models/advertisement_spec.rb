require 'rails_helper'

RSpec.describe Advertisement, type: :model do
    
  let(:advertisement) { Advertisement.create!(title: "New Ad Title", body: "New Ad Body")}
  
  describe "attributes" do
      it "responds to title" do
          expect(advertisement).to respond_to(:title)
      end
      
      it "responds to body" do
          expect(advertisement).to respond_to(:body)
      end
  end
end

  
  
  
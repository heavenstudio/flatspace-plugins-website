require 'spec_helper'

describe Plugin do
  it { should have_fields(:title, :description).of_type(String) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  
  it "should have a valid factory" do
    build(:plugin).should be_valid
  end
  
  it "should persist its factory" do
    create(:plugin).should be_persisted
  end
end

require 'spec_helper'

describe Plugin do
  it { should have_fields(:title, :description).of_type(String) }
  it { should have_fields(:created_at, :updated_at).of_type(Time) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:user) }
  
  it { should belong_to(:user) }
  
  it "should have a valid factory" do
    build(:plugin).should be_valid
  end
  
  it "should persist its factory" do
    create(:plugin).should be_persisted
  end
end

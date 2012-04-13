require 'spec_helper'

describe User do
  it { should have_fields(:name, :facebook_id).of_type(String) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :facebook_id }
  
  it "should have a valid factory" do
    build(:user).should be_valid
  end
  
  it "should persist its factory" do
    create(:user).should be_persisted
  end
end

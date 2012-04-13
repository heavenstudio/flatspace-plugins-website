# encoding: UTF-8
require 'spec_helper'

describe ApplicationController do
  describe 'user_signed_in?' do
    it 'should return false if session[:user_id] is empty' do
      @controller.send(:user_signed_in?).should be_false
    end
    
    it 'should return true if session[:user_id] is present' do
      session[:user_id] = 1
      @controller.send(:user_signed_in?).should be_true
    end
  end
  
  describe 'authenticate_user!' do
    it "should do nothing if user is signed in" do
      @controller.stub(user_signed_in?: true)
      @controller.send(:authenticate_user!)
      response.should be_success
    end
  end
  
  describe 'current_user' do
    it 'should return nil if the user is not signed in' do
      @controller.stub(user_signed_in?: false)
      @controller.send(:current_user).should == nil
    end
    
    it 'should return the user if the user is signed in' do
      user = create(:user)
      @controller.stub(user_signed_in?: true, session: {user_id: user.id})
      @controller.send(:current_user).should == user
    end
  end
end

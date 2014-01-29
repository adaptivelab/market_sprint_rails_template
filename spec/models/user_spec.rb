require 'spec_helper'

describe User do
  describe "factory" do
    let(:user) { FactoryGirl.build(:user) }

    it "creates a valid user" do
      expect(user).to be_valid
    end
  end
end

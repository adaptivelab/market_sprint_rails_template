require 'spec_helper'

describe "pages/show.html.haml" do
  it "should render" do
    assign(:page, FactoryGirl.create(:page))
    render
  end
end


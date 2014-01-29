require 'spec_helper'

describe PagesController do

  describe "GET 'show'" do
    describe "with no layout" do
      let(:page) { FactoryGirl.create(:page, :no_layout) }

      it "renders with application layout" do
        get :show, id: page.to_param
        expect(controller).to render_template(layout: "application")
      end
    end

    describe "with valid params" do
      let(:page) { FactoryGirl.create(:page) }
      before { get 'show', id: page.to_param }

      it "returns http success" do
        response.should be_success
      end

      it "should render the show template" do
        expect(controller).to render_template("pages/show")
      end

      it "should render the page's layout" do
        expect(controller).to render_template(layout: page.layout)
      end

      it "should assign the page" do
        expect(assigns[:page]).to be_a(Page)
      end
    end
  end

end

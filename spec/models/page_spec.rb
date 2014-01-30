require 'spec_helper'

describe Page do
  let(:page) { FactoryGirl.build(:page) }

  describe "#to_param" do
    it "is the slug" do
      expect(page.to_param).to eql(page.slug)
    end
  end

  describe "#title" do
    describe "when blank" do
      before { page.title = "" }

      it "is a titleized version of the slug" do
        expect(page.title).to eql(page.slug.titleize)
      end

      describe "when slug is nil" do
        before { page.slug = nil }

        it "is blank" do
          expect(page.title).to eql("")
        end
      end
    end
  end
end

require 'rails_helper'

describe LayoutHelper, :type => :helper do
  describe "#section_title" do
    it "returns No title when title is not set" do
      expect(helper.section_title).to eq("No title")
    end

    it "returns content_for title when title is set" do
      title = double("Title")
      allow(helper).to receive(:content_for).with(:title).and_return(title)
      expect(helper.section_title).to eq(title)
    end
  end
end

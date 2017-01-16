require 'spec_helper'

RSpec.describe FlickrbCollage::Cell do
  let(:cell) { FlickrbCollage::Cell.new(0, 5, 40, 20) }

  describe "#aspect_ratio" do
    it "returns the aspect_ratio of cell" do
      expect(cell.aspect_ratio).to eq(2.0)
    end
  end

  describe "#to_minimagick" do
    it "returns a string with the expected format to MiniMagick" do
      expect(cell.to_minimagick).to eq("40x20+0+5")
    end
  end
end

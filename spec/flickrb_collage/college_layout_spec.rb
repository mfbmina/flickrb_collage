require 'spec_helper'

RSpec.describe FlickrbCollage::CollageLayout do
  let(:collage_layout) { FlickrbCollage::CollageLayout.new }

  describe "#cell_dimensions" do
    it "returns a cell dimensions on MiniMagick format" do
      expect(collage_layout.cell_dimensions(0)).to eq("460x480+0+0")
    end

    it "returns a cell dimensions on MiniMagick format" do
      expect(collage_layout.cell_dimensions(3)).to eq("460x960+1840+0")
    end
  end

  describe "#height" do
    it "returns the layout height" do
      expect(collage_layout.height).to eq(FlickrbCollage::CollageLayout::HEIGHT)
    end
  end

  describe "#width" do
    it "returns the layout width" do
      expect(collage_layout.width).to eq(FlickrbCollage::CollageLayout::WIDTH)
    end
  end

  describe "#crop_dimensions" do
    it "returns the crop dimensions" do
      expect(collage_layout.crop_dimensions(0, 1000, 1000)).to eq("958.3333333333334x1000+0+0")
    end

    it "returns the crop dimensions" do
      expect(collage_layout.crop_dimensions(0, 100, 324)).to eq("100x104.3478260869565+0+0")
    end
  end
end

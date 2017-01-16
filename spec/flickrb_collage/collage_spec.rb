require 'spec_helper'

RSpec.describe FlickrbCollage::Collage do
  let(:collage) { FlickrbCollage::Collage.new([Tempfile.new('flickr_image')]) }
  let(:image) { double() }

  describe "#build" do
    it "add a list of images to MiniMagick image" do
      allow(MiniMagick::Image).to(receive(:open).and_return(image))
      allow(image).to(receive(:crop).and_return(image))
      allow(image).to(receive(:width).and_return(10.0))
      allow(image).to(receive(:height).and_return(11.0))
      allow(image).to(receive(:path).and_return('/tmp'))
      allow_any_instance_of(MiniMagick::Image).to(receive(:composite).and_return(image))
      allow(image).to(receive(:write))
      expect(collage.build).to be_truthy
    end
  end

  describe "#create" do
    it "add a list of images to MiniMagick image" do
      allow(FileUtils).to(receive(:mv))
      expect { collage.create('image123.png') }.to output("Finished collage is available at image123.png\n").to_stdout
    end
  end
end

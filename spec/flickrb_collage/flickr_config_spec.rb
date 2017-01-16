require 'spec_helper'

RSpec.describe FlickrbCollage::FlickrConfig do
  describe "#call" do
    it "returns a FlickRaw::Flickr instance" do
      config = FlickrbCollage::FlickrConfig.new
      expect(config.call).to be_an_instance_of(FlickRaw::Flickr)
    end
  end

  describe "#self.call" do
    it "returns a FlickRaw::Flickr instance" do
      expect(FlickrbCollage::FlickrConfig.call).to be_an_instance_of(FlickRaw::Flickr)
    end
  end
end

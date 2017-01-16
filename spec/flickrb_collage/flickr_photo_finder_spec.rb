require 'spec_helper'

RSpec.describe FlickrbCollage::FlickrPhotoFinder do
  describe "#call" do
    it "raise an exception when keyword isnt given" do
      photo_finder = FlickrbCollage::FlickrPhotoFinder.new
      expect { photo_finder.call }.to raise_error(FlickRaw::FailedResponse)
    end

    it "returns a FlickRaw::Response" do
      photo_finder = FlickrbCollage::FlickrPhotoFinder.new('dog')
      expect(photo_finder.call).to be_an_instance_of(FlickRaw::Response)
    end

    it "returns nil when cant find pics" do
      photo_finder = FlickrbCollage::FlickrPhotoFinder.new('a1s2s3d34f45')
      expect(photo_finder.call).to be_nil
    end
  end
end

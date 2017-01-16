require 'spec_helper'

RSpec.describe FlickrbCollage::FlickrPhotoUrl do
  describe "#call" do
    it "raise an exception when id isnt given" do
      photo_url = FlickrbCollage::FlickrPhotoUrl.new
      expect { photo_url.call }.to raise_error(FlickRaw::FailedResponse)
    end

    it "returns the image source" do
      photo_url = FlickrbCollage::FlickrPhotoUrl.new('32332511845')
      expect(photo_url.call).to eq("https://farm1.staticflickr.com/560/32332511845_463f34dd31_o.jpg")
    end

    it "returns an exception when cant find pics with an id" do
      photo_url = FlickrbCollage::FlickrPhotoUrl.new('a1s2s3d34f45')
      expect { photo_url.call }.to raise_error(FlickRaw::FailedResponse)
    end
  end
end

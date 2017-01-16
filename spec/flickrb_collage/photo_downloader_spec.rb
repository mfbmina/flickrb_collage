require 'spec_helper'

RSpec.describe FlickrbCollage::PhotoDownloader do
  let(:url) { "https://farm1.staticflickr.com/560/32332511845_463f34dd31_o.jpg" }

  describe "#self.call" do
    it "return a tempfile with the photo" do
      allow(FlickrbCollage::PhotoDownloader).to(receive(:open))
      allow(IO).to(receive(:copy_stream))
      expect(FlickrbCollage::PhotoDownloader.call(url)).to be_an_instance_of(Tempfile)
    end

    it "returns an exception when open gives a timeout" do
      allow(FlickrbCollage::PhotoDownloader).to(receive(:open).and_raise(Net::OpenTimeout))
      expect { FlickrbCollage::PhotoDownloader.call(url) }.to raise_error(Net::OpenTimeout)
    end

    it "returns an exception when read gives a timeout" do
      allow(FlickrbCollage::PhotoDownloader).to(receive(:open).and_raise(Net::ReadTimeout))
      expect { FlickrbCollage::PhotoDownloader.call(url) }.to raise_error(Net::ReadTimeout)
     end
  end
end

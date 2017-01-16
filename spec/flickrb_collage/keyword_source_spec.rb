require 'spec_helper'

RSpec.describe FlickrbCollage::KeywordSource do
  describe "#call" do
    it "returns a random word" do
      keyword = FlickrbCollage::KeywordSource.new
      expect(keyword.call).to be_an_instance_of(String)
    end

    it "returns a mock word" do
      keyword = FlickrbCollage::KeywordSource.new
      allow_any_instance_of(Array).to(receive(:sample).and_return('example'))
      expect(keyword.call).to eq('example')
    end
  end
end

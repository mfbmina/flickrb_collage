require 'flickraw'
require 'yaml'

module FlickrbCollage
  class FlickrConfig
    def initialize(config_file = File.expand_path("config/flickr.yml"))
      configs = YAML.load_file(config_file)['flickr']
      FlickRaw.api_key = configs["api_key"]
      FlickRaw.shared_secret = configs["secret"]
    end

    def call
      FlickRaw::Flickr.new
    end

    def self.call
      new.call
    end
  end
end

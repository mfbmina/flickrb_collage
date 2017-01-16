require 'open-uri'
require 'tempfile'

module FlickrbCollage
  module PhotoDownloader
    MAX_RETRIES = 3

    def self.call(url)
      tempfile = Tempfile.new('flickr_image')
      IO.copy_stream(open(url), tempfile)
      tempfile.rewind
      puts "Downloaded to #{tempfile.path}"
      tempfile
    rescue Net::ReadTimeout, Net::OpenTimeout => e
      @retries ||= 0
      @retries += 1
      puts 'Retrying download'
      retry if @retries <= 3
      raise e
    end
  end
end

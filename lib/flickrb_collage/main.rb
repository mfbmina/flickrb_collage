require_relative 'flickr_config'
require_relative 'flickr_photo_finder'
require_relative 'flickr_photo_url'
require_relative 'keyword_source'
require_relative 'photo_downloader'
require_relative 'collage'

module FlickrbCollage
  class Main
    def initialize(keywords = [])
      @keywords = keywords
      complete_keywords
    end

    def call
      files = @keywords.map do |keyword|
        keyword = KeywordSource.new.call until flickr_photo = FlickrPhotoFinder.new(keyword).call
        url = FlickrPhotoUrl.new(flickr_photo.id).call
        PhotoDownloader.call(url)
      end

      collage = Collage.new(files)
      collage.build
      puts "What is the filename? Default is using a timestamp"
      filename = STDIN.gets.chomp
      filename.empty? ? collage.create : collage.create(ensure_extension(filename))
    end

    def complete_keywords
      @keywords << KeywordSource.new.call while @keywords.size < 10
    end

    def ensure_extension(filename)
      array = filename.split('.')
      "#{array.first}.png"
    end
  end
end

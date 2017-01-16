module FlickrbCollage
  class FlickrPhotoFinder
    attr_reader :keyword, :flickr

    def initialize(keyword = '', flickr = FlickrConfig.call)
      @flickr = flickr
      @keyword = keyword
    end

    def call
      flickr.photos.search(text: keyword).first
    end
  end
end

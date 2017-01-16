module FlickrbCollage
  class FlickrPhotoUrl
    attr_reader :id, :flicker

    def initialize(id = '', flicker = FlickrConfig.call)
      @flicker = flicker
      @id = id
    end

    def call
      # Get the last size. Usually, it is the original size.
      # using fixnum because it doesnt respond to last method.
      flicker.photos.getSizes(photo_id: id)[-1].source
    end
  end
end

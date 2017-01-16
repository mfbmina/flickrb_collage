require "flickrb_collage/version"
require "flickrb_collage/main"

module FlickrbCollage
  def self.create(args)
    Main.new(args).call
  end
end

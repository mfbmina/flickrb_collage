require 'mini_magick'
require_relative 'collage_layout'

module FlickrbCollage
  class Collage
    attr_reader :layout, :image_paths, :canvas

    def initialize(image_paths = [], layout = CollageLayout.new)
      @layout = layout
      @image_paths = image_paths
      @canvas = create_new_image
    end

    def build
      images = image_paths.map { |p| MiniMagick::Image.open p.path }
      resized_images = image_paths.map.with_index do |path, index|
        image = MiniMagick::Image.open(path.path)
        image.crop(layout.crop_dimensions(index, image.width, image.height))
        add_image_to_canvas(image, layout.cell_dimensions(index))
      end
      true
    end

    def create(file_name = "#{DateTime.now.strftime('%Y%m%d%H%M%S')}.png")
      FileUtils.mv(canvas.path, file_name)
      puts "Finished collage is available at #{file_name}"
    end

    private

    def add_image_to_canvas(image, dimensions)
      tempfile = MiniMagick::Image.new(canvas.path)
      result = tempfile.composite(image) do |c|
        puts "Adding image to collage #{image}"
        c.compose('Over')
        c.geometry(dimensions)
      end
      result.write(canvas.path)
      canvas.rewind
    end

    def create_new_image
      tempfile = Tempfile.new(['collage', '.png'])
      MiniMagick::Tool::Convert.new do |i|
        i.size "#{layout.width}x#{layout.height}"
        i.xc "white"
        i << tempfile.path
      end
      tempfile
    end
  end
end

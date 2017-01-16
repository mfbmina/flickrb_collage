module FlickrbCollage
  class Cell
    attr_reader :width, :height, :x, :y

    def initialize(x = 0, y = 0, width, height)
      @x = x
      @y = y
      @width = width
      @height = height
    end

    def aspect_ratio
      width.to_f / height.to_f
    end

    def to_minimagick
      "#{width}x#{height}+#{x}+#{y}"
    end
  end
end

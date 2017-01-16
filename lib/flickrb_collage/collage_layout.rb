require_relative 'cell'

module FlickrbCollage
  class CollageLayout
    WIDTH = 2304
    HEIGHT = 1440
    LAYOUT = [
      [0, 1, 2, 2, 3],
      [4, 4, 5, 6, 3],
      [4, 4, 7, 8, 9]
    ]

    def crop_dimensions(cell_index, image_width, image_height)
      image_cell = Cell.new(image_width, image_height)
      cell = cell_rect(cell_index)

      if image_cell.aspect_ratio >= cell.aspect_ratio
        crop_size = image_cell.width - (image_cell.height * cell.aspect_ratio)
        target_width = image_cell.width - crop_size
        target_height = image_cell.height
      else
        crop_size = image_cell.height - (image_cell.width / cell.aspect_ratio)
        target_width = image_cell.width
        target_height = image_cell.height - crop_size
      end

      Cell.new(0, 0, target_width, target_height).to_minimagick
    end

    def cell_dimensions(index)
      cell_rect(index).to_minimagick
    end

    def height
      HEIGHT
    end

    def width
      WIDTH
    end

    private

    def cell_rect(index)
      row, column = cell_coordinates(index)
      column_width = width / columns.size
      column_height = height / rows.size

      Cell.new(column * column_width, row * column_height, cell_width(index), cell_height(index))
    end

    def rows
      LAYOUT
    end

    def columns
      LAYOUT.transpose
    end

    def cell_coordinates(index)
      row = rows.find_index { |row| row.include?(index) }
      column = columns.find_index { |row| row.include?(index) }
      [row, column]
    end

    def index_occurances(table, index)
      table.map { |row| row.count(index) }.max
    end

    def calculate_cell_size(total, divisions, multiplier)
      return 0 if multiplier == 0
      (total / divisions) * multiplier
    end

    def cell_width(index)
      size_multiplier = index_occurances(rows, index)
      calculate_cell_size(WIDTH, columns.size, size_multiplier)
    end

    def cell_height(index)
      size_multiplier = index_occurances(columns, index)
      calculate_cell_size(HEIGHT, rows.size, size_multiplier)
    end
  end
end

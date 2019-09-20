class Image
  attr_accessor :image

  def initialize (image)
    @image = image
  end

  def output_image
    puts "Sample"
    @image.each do |row|
      puts row.join
    end
  end

  def blur(distance)
    pixels = []
    @image.each_with_index do |row, row_index|
      row.each_with_index do |value, value_index|
        if value == 1
          pixels << [row_index, value_index]
        end
      end
    end       

    pixels.each do |pixel|
      row_pixel = pixel[0]
      col_pixel = pixel[1]
      i = distance
      (0..distance).each do |i|
        (0..distance - i).each do |j|
          @image[row_pixel + i][col_pixel + j] = 1 if row_pixel + i < @image.length and col_pixel + j < @image.length
          @image[row_pixel - i][col_pixel - j] = 1 if row_pixel - i >= 0 and col_pixel - j >= 0
          @image[row_pixel - i][col_pixel + j] = 1 if row_pixel - i >= 0 and col_pixel + j < @image.length
          @image[row_pixel + i][col_pixel - j] = 1 if row_pixel + i < @image.length and col_pixel - j >= 0
        end
      end
    end
    puts "Blurred"
    @image.each do |row|
      puts row.join
    end 
  end
end

image = Image.new([
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 1, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0],
])

image.output_image
image.blur(2)
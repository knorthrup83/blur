class Image
  def initialize(image)
    @image = image
  end

  def output_image(manhattan)
    #create a variable with a new memory address for each cell
    @new_array = Marshal.load(Marshal.dump(@image))
    @image.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        if cell == 1
          blur(manhattan, col_index, row_index)
        end
      end
    end
    @new_array.each do |x|
      puts x.join()
    end
  end


  def blur(distance, col_index, row_index)
    original_col_index = col_index
    #UP & DOWN 
      modify_column(distance, col_index, row_index)
    #LEFT     
      move_distance = distance
      # While distance > 0
      while move_distance > 0
        if !can_I_move(col_index, row_index, "left")
          break
        end
        move_distance -= 1
        col_index -= 1
        modify_column(move_distance, col_index, row_index)
      end 
    #RESET
      col_index += original_col_index
    #RIGHT
      move_distance = distance
      while move_distance > 0
        if !can_I_move(col_index, row_index, "right")      
          break
        end
        move_distance -= 1
        modify_column(move_distance, col_index, row_index)
        col_index += 1
      end
  end



  def modify_column(distance, col_index, row_index)
      original_row_index = row_index
  #HORIZONTAL
      @new_array[row_index][col_index] = 1
  #UP
      move_distance = distance
      while move_distance > 0
        if !can_I_move(col_index, row_index, "up")
          break
        end    
        row_index -= 1
        @new_array[row_index][col_index] = 1

        move_distance -= 1 
      end
    
  #RESET
      row_index = original_row_index

  #DOWN      
      move_distance = distance
      while move_distance > 0
        if !can_I_move(col_index, row_index, "down")
          break
        end    
        row_index += 1
        @new_array[row_index][col_index] = 1
        move_distance -= 1 
      end
  end



  def can_I_move(col_index, row_index, direction)
      if direction == "left"
        if col_index != 0
          return true
        end
      elsif direction == "right"
        if col_index < @image[row_index].length - 1
          return true
        end
      elsif direction == "up"
        if row_index != 0
          return true
        end
      elsif direction == "down"
        if row_index < @image.length - 1
          return true
        end
      else
          return false
      end
  end


end

image = Image.new([
  [0, 0, 0, 0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0, 0, 0, 0]
])
puts image
image.output_image(2)
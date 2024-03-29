class Image
  def initialize(image)
    @image = image
  end

  def output_image
    #create a variable with a new memory address for each cell
    @new_array = Marshal.load(Marshal.dump(@image))
    @image.each_with_index do |row, row_index|
      row.each_with_index do |cell, col_index|
        if cell == 1
          # Testing if we can move left
          if col_index != 0
            @new_array[row_index][col_index - 1] = 1
          end

          # Testing if we can move right
          if col_index < row.length - 1
            @new_array[row_index][col_index + 1] = 1
          end

          #Test if we can move up
          if row_index != 0
            @new_array[row_index - 1][col_index] = 1
          end

          #Test if we can move down
          if row_index < @image.length - 1
            @new_array[row_index + 1][col_index] = 1
          end

        end
      end
    end
    @new_array.each do |x|
      puts x.join()
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
    [0, 0, 0, 1],
    [0, 0, 0, 0]
])

image.output_image


# If cell=1
#Going to the left
  # While distance > 0
  # If ! CanIMove
    # break
  # Distance -= 1
  # Call ModifyColumn(direction (i.e. up), distance)
  # Call ModifyColumn(direction (i.e. down), distance)
#Going to the right
  # While distance > 0
  # If ! CanIMove
    # break
  # Distance -= 1
  # Call ModifyColumn(direction (i.e. up), distance)
  # Call ModifyColumn(direction (i.e. down), distance)




# Iterate through cells until a 1 is detected
# ModifyColumn(direction): While distance > 0, 
    # if ! CanIMove(x,y)
      #break
      # Move direction 1 unit
      # Subtract 1 from distance
      # Modify column up and down (distance, directionUp/Dn)
        # Loop "distance" num of times
          # Move "direction" and change value (if possible)
    

# Method: CanIMove (x,y)
  # Check (lines 13-30)
    # return boolean
  # Move if possible
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





        end
      end
    end
    @new_array.each do |x|
      puts x.join()
    end
  end






  def blur(distance)

#First need to move up and down distance
  # While distance >0
  # if can move up, do so
    #Change to 1


    ##Going to the left
      move_distance = distance
      # While distance > 0
      while move_distance > 0
          # If ! CanIMove
          if !can_I_move(col_index, row_index, "left")
            # break
            break
          end
          # Distance -= 1
          move_distance -= 1

          # Call ModifyColumn(direction (i.e. up), distance)
          modify_column("up", move_distance)
          # Call ModifyColumn(direction (i.e. down), distance)    
          modify_column("down", move_distance)
        end 

    ##Going to the right
      move_distance = distance
      # While distance > 0
      while move_distance > 0
      # If ! CanIMove
        if !can_I_move(col_index, row_index, "right")      
        # break
          break
        end
      # Distance += 1
        move_distance += 1
      # Call ModifyColumn(direction (i.e. up), distance)
        modify_column("up", move_distance)
      # Call ModifyColumn(direction (i.e. down), distance)
        modify_column("down", move_distance)
      end

  end



  def modify_column(direction, distance)
    move_distance = distance
    # ModifyColumn(direction): While distance > 0, 
    while distance > 0
    # if ! CanIMove(x,y)
      if !can_I_move
        #break
        break
      end
      # Move direction 1 unit
      if direction = "up"
      # Subtract 1 from distance

      # Modify column up and down (distance, directionUp/Dn)
        # Loop "distance" num of times
          # Move "direction" and change value (if possible)
  end


  # Method: CanIMove (x,y)  
  def can_I_move(col_index, row_index, direction)
      # Testing if we can move left
      if direction == "left"
        if col_index != 0
          return true
        #@new_array[row_index][col_index - 1] = 1
        end
      elsif direction == "right"
      # Testing if we can move right
        if col_index < row.length - 1
          return true
        #@new_array[row_index][col_index + 1] = 1
        end
      elsif direction == "up"
      #Test if we can move up
        if row_index != 0
          return true
        #@new_array[row_index - 1][col_index] = 1
        end
      elsif direction == "down"
      #Test if we can move down
        if row_index < @image.length - 1
          return true
        #@new_array[row_index + 1][col_index] = 1
        end
      else
          return false
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

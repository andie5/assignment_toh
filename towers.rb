#!/usr/bin/ruby
# Towers of Hanoi\

class TowerOfHanoi
  # attr_accessor :last_name

  # Intialise the board
  def initialize(n)
    @no_of_disks = n
    @won = false
    @game_play = true
    @toh = Array.new(3)
    @toh[0] = (1..n).to_a
    @toh[1], @toh[2] = []

    # Play the game
    play
  end

  # Return the number of disks selected for this game


  # attr_reader (:no_of_disks, :won, :game_play, :toh)

  def play
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'. Enter 'q' to quit."

    

    while (@won != true && @game_play != false)   
      get_user_input
    end
  end

  def get_user_input

    # Show the current state of the board
    render

    puts "Enter move >"
      
    user_input = gets.chomp
    puts "user input is #{user_input}"
    
    if(user_input.include?(","))
      puts "contains a comma"
      moves = user_input.split(",")
      if(moves.length == 2)
        puts "Correct number of arguments"
        move(moves[0].to_i, moves[1].to_i)
      else 
        help
        get_user_input
      end
    elsif user_input == "q"
        @game_play = false
        puts "Game over. See you next time!"
    else
      help
      get_user_input
    end
  end

  def help
    puts "Enter a move in the correct format 'num, num'"
    puts "Eg. 1,2"
  end


  # Check if the game was won
  def game_won
    won = true
    temp = 1

    if(@toh[0].empty? && @toh[1].empty?)
      if(@toh[2].length == @no_of_disks)
        @toh[2].each do |element|
          if element = temp + 1
            element+=1
          else
            won = false
            return won
          end
        end
      else
        won = false
        return won
      end
    else
      won = false
      return won
    end
  end

  



  # Move a disk from 1 pin to the other
  def move(from, to)
    if move_valid?(from, to)
      puts "valid move"
      puts "#{@toh}"

      from = from-1
      to = to-1

      disk = @toh[from].shift

      puts "The disk we are moving #{disk}"
      

      puts "The current state of the pin we are pushing to #{@toh[to]}and from #{@toh[from]}"

      if(@toh[to].nil?)
        @toh[to] = [disk]
        puts "The to destination was empty"
      else
        @toh[to].unshift(disk)
      end

      puts "After change #{@toh}"

      # Check if that was the winning move
      if game_won
        @game_play = false
      end
    else
      puts "That was an invalid move. Please try again"
    end
  end

  # Check if the move was valid
  def move_valid?(from, to)

    puts "checking if the moves are valid"
    puts "moving from #{from} to #{to}"

    if(from.between?(1,3) && to.between?(1,3))
      "valid pin number"
      from = from-1
      to = to-1
      if (@toh[to].nil?)
        puts "destination pin is empty"
        return true  
      elsif(@toh[to].first < @toh[from].first)
        return true
      else false
      end
    else false
    end
  end
 
# Draw the current state of the board
  def render

    # Loop over each pin array.
    @toh.each do |pin|

      # Loop over each disk on the pins.

      if pin  
        pin.each do |disk|
          puts disk
        end
      end

    # End of pin.
    puts "--"
    end
  end
  
end

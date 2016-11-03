#!/usr/bin/ruby
# Towers of Hanoi\

class TowersOnHanoi
  # attr_accessor :last_name

  # Intialise the board
  def initialize(n)
    @no_of_disks = n
    @won = false
    @game_play = true
    @toh = Array.new(3)
    toh[0] = (1..n).to_a

    play
  end

  # Return the number of disks selected for this game
  attr_reader @no_of_disks, @won, @game_play, @toh

  def play
    puts "Welcome to Tower of Hanoi!"
    puts "Instructions:"
    puts "Enter where you'd like to move from and to"
    puts "in the format '1,3'. Enter 'q' to quit."

    render

    while (@won != true || game_play != false)   
      get_user_input
    end
  end

  def get_user_input
    puts "Enter move >"
      
    user_move = gets.chomp
    moves = user_move.split(",")

    if (move.length == 3)
      if(move[1] == ",")
        if (move[0].to_i <= 3 && (move[2].to_i >= 1 ))
          move(move[0].to_i, move[2].to_i)
        else puts "Enter a move in the correct format 'num, num'"
          get_user_input
        end
      end
    elsif user_move == "q"
      game_play = false
    else puts "Enter a move in the correct format 'num, num'"
          get_user_input
    end
  end


  # Check if the game was won
  def game_won
    won = true
    temp = 1

    if(@toh[0].empty? && @toh[1].empty?)
      @toh[2].each do |element|
        if element = temp + 1
          element+=1
        else
          won = false
          return won
        end
      end
    end

  end

  # Check if the move was valid
  def move_valid?(from, to)
    if @toh[to].first < array[from].first
      return true
    else false
    end
  end



  # Move a disk from 1 pin to the other
  def move(toh, from, to)
    if move_valid?(toh, from, to)

      disk = toh[from].shift
      @toh[to].unshift(disk)

      # Check if that was the winning move
      game_won(@toh)
    else
      puts "That was an invalid move. Please try again"
    end
  end
 
# Draw the current state of the board
  def render

    # Loop over each pin array.
    @toh.each do |pin|

      # Loop over each disk on the pins.
      pin.each do |disk|
        puts disk
      end

    # End of pin.
    puts "--"
    end
  end
  
end
in the format '1,3'. Enter 'q' to quit.
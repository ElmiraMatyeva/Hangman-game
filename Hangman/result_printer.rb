class ResultPrinter

  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__)

    counter = 0

    while counter <= 7

      file_name = current_path + "/image/#{counter}.txt"

      if File.exist?(file_name)
        file = File.new(file_name, 'r:UTF-8')
        @status_image << file.read
        file.close
      else
        @status_image << "\n [Image not found] \n"
      end
      counter += 1
    end
  end

  def print_hangman(errors)
    puts @status_image[errors]
  end

  def print_status(game)
    
    cls 

    puts "\nThe word:  #{get_word_for_print(game.letters, game.good_letters)}"
    puts "Errors(#{game.errors}): #{game.bad_letters.join(", ")}"

    print_hangman(game.errors)

    if game.status == -1
      puts "\n***** You lost :( *****\n\n"
      puts "The word was: " + game.letters.join("") + "\n\n"
    elsif game.status == 1
      puts "\n***** Congratulations! You won! *****\n\n"
    else
      puts "Attempts left: " + (7 - game.errors).to_s
    end

  end

  def get_word_for_print(letters, good_letters)
    
    result = ""

    for item in letters do
      if good_letters.include?(item)
        result += item + " "
      else
        result += "__ "
      end
    end

    return result

  end
  
  def cls 
    system('clear') || system('cls')
  end    

end










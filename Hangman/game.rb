class Game

  def initialize(word)
    @letters = get_letters(word)
    @errors = 0
    @good_letters = []
    @bad_letters = []
    @status = 0
  end

  def get_letters(word)
    if word == nil || word == ""
      abort "It's an empty word :("
    end

    return word.encode("UTF-8").split("")
  end

    def status
      return @status
    end

  def next_step(letter)
    if @status == -1 || @status == 1
      return
    end
  

    if @good_letters.include?(letter) || @bad_letters.include?(letter)
      return
    end

    if @letters.include?(letter)
      @good_letters << letter
        if @good_letters.uniq.sort == @letters.uniq.sort
          @status = 1
        end

    else
      @bad_letters << letter
      @errors += 1
    
      if @errors >= 7
        @status = -1
      end
    end
  end

  def ask_next_letter
    puts "Enter next letter"

    letter = ""

    while letter == ""
      letter = STDIN.gets.encode("UTF-8").chomp
    end

    next_step(letter)
  end

  def errors
    @errors
  end

  def letters
    @letters
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

end



















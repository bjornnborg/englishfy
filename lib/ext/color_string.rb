class String

  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def black
    colorize(30)
  end

  def white
    colorize(37)
  end

  def red
    colorize(31)
  end

  def red_background
    colorize(41)
  end

  def green
    colorize(31)
  end

  def green_background
    colorize(42)
  end

  def reverse
    "\e[7m#{self}\e[27m"
  end

  def bold
    "\e[1m#{self}\e[22m"
  end

  #https://stackoverflow.com/questions/1489183/colorized-ruby-output-to-the-terminal

end

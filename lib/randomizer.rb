class Randomizer

  def initialize(options_array)
    @options = options_array
  end

  def get
    max_size = @options.length - 1
    position = rand(0..max_size)
    @options[position]
  end

end

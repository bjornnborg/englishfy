class DefaultRandomLanguageService

  def initialize(language_from, language_to)
    @language_from_to = [language_from, language_to]
  end

  def random_language
    max_size = @language_from_to.length - 1
    position = rand(0..max_size)
    @language_from_to[position]
  end

end

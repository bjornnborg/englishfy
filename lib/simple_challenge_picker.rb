class SimpleChallengePicker

  def initialize(language_from_to, answers_from_to, random_service)
    @random_service = random_service
    @language_from_to = language_from_to

    @lang_from = language_from_to.first
    @lang_to = language_from_to.last

    @answers_from = answers_from_to.first
    @answers_to = answers_from_to.last
  end

  def pick(quantity=1)
    chosen_language = @random_service.random_language
    puts ">>> Escolhida a lingua #{chosen_language}"
    lookup_map = chosen_language == @lang_to ? @answers_from : @answers_to

    terms = lookup_map.keys.sample(quantity)

    puts ">>> Escolhido o termo #{terms}"
    challenge = {
      language: chosen_language,
      terms: terms,
      question: "How do you say #{terms.map(&:upcase).join(',')} in #{chosen_language}?" # refator to support from ES to FR in future
    }

    challenge
  end

end

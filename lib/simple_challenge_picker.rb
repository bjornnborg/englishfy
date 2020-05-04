require_relative 'simple_answer_checker'
class SimpleChallengePicker

  def initialize(language_from_to, answers_from_to, random_service)
    @random_service = random_service
    @language_from_to = language_from_to

    @lang_from = language_from_to.first
    @lang_to = language_from_to.last

    @answers_from = answers_from_to.first
    @answers_to = answers_from_to.last

    @simple_answer_checker = SimpleAnswerChecker.new(language_from_to, answers_from_to)
  end

  def pick(quantity=1)
    chosen_language = @random_service.random_language
    lookup_map = chosen_language == @lang_to ? @answers_to : @answers_from

    terms = lookup_map.keys.sample(quantity)
    challenge = {
      language: chosen_language,
      terms: terms,
      question: "How do you say #{terms.map(&:upcase).join(',')} in #{chosen_language}?" # refator to support from ES to FR in future
    }

    challenge
  end

  def check(challenge, answer)
    @simple_answer_checker.check(challenge, answer)
  end

end

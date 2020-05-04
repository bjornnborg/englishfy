class SimpleAnswerChecker

  def initialize(language_from_to, answers_from_to)
    @lang_from = language_from_to.first
    @lang_to = language_from_to.last

    @answers_from = answers_from_to.first
    @answers_to = answers_from_to.last
  end

  def check(challenge, answer)
    puts ">>>> o desafio foi #{challenge}"
    lookup_map = challenge[:language] == @lang_to ? @answers_to : @answers_from

    puts ">>>> lookup #{lookup_map}"

    possible_answers = lookup_map[answer]
    valid = possible_answers && possible_answers.include?(challenge[:terms].first.downcase)  #simple checker supports only one term

    valid
  end

end

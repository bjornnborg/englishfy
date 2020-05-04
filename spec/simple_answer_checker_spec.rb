require './lib/simple_answer_checker'

describe 'simple_answer_checker' do

    english_terms = {
      "i" => ["eu"],
      "you" => ["você", "vocês"]
    }

    portuguese_terms = {
      "eu" => ["i"],
      "você" => ["you"],
      "vocês" => ["you"]
    }

    answer_checker = SimpleAnswerChecker.new([:portugues, :english], [portuguese_terms, english_terms])

  context 'from -> to translations' do

    it 'founds the expected translation' do
      challenge = {terms: ["você"], language: :english}
      expect(answer_checker.check(challenge, "you")).to be_truthy
    end

    it 'does not found the expected translation' do
      challenge = {terms: ["você"], language: :english}
      expect(answer_checker.check(challenge, "she")).to be_falsy
    end

  end

  context 'to -> from translation' do
    it 'founds the expected translation' do
      challenge = {terms: ["you"], language: :portugues}
      expect(answer_checker.check(challenge, "você")).to be_truthy
    end

    it 'does not found the expected translation' do
      challenge = {terms: ["you"], language: :portugues}
      expect(answer_checker.check(challenge, "ele")).to be_falsy
    end    

  end


end

require './lib/simple_challenge_picker'
require './lib/default_random_language_service'

describe 'simple_challenge_picker' do

  english = {
    "i" => ["eu"],
    "you" => ["você", "vocês"],
    "he" => ["ele"],
    "she" => ["ela"],
    "it" => ["isso"],
    "they" => ["eles", "elas"]
  }

  portuguese = {
    "eu" => ["i"],
    "você" => ["you"],
    "vocês" => ["you"],
    "ele" => ["he"],
    "ela" => ["she"],
    "isso" => ["it"],
    "eles" => ["they"],
    "elas" => ["they"]
  }

  languages = [:portuguese, :english]

  
  challenge_picker = SimpleChallengePicker.new(languages, [portuguese, english], DefaultRandomLanguageService.new(languages.first, languages.last))

  context 'terms' do
    it 'picks the right amount of terms' do
      challenge = challenge_picker.pick(3)
      expect(challenge[:terms].size).to eq 3
    end

    it 'uses a default value' do
      challenge = challenge_picker.pick
      expect(challenge[:terms].size).to eq 1
    end
  end

  context 'chosen language' do
    it 'always choose a valid language' do
      200.times do
        challenge = challenge_picker.pick
        expect(languages.include?(challenge[:language])).to be_truthy
      end
    end
  end

  context 'question' do
    it 'contains the only one term' do
      challenge = challenge_picker.pick
      expect(challenge[:question].include?(challenge[:terms].first.upcase)).to be_truthy
    end

    it 'contains all terms' do
      challenge = challenge_picker.pick(3)
      challenge[:terms].each do |term|
        expect(challenge[:question].include?(term.upcase)).to be_truthy
      end
    end

    it 'joins all terms' do
      challenge = challenge_picker.pick(3)
      joined_terms = challenge[:terms].map(&:upcase).join(',')
      expect(challenge[:question].include?(joined_terms)).to be_truthy
    end
  end

  context 'check answers' do
    it 'checks valid answer' do
      challenge = {terms: ["you"], language: portuguese}
      expect(challenge_picker.check(challenge, "você")).to be_truthy
    end
  end

end

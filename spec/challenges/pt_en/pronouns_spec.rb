require './lib/challenges/pt_en/pronouns'
require './lib/default_random_language_service'

describe 'pt_en pronouns' do

  pronouns = Challenges::PtEn::Pronouns.new

  context 'build challenger' do
    it 'builds a correct challenger' do
      challenger = pronouns.build
      200.times do
        challenge = challenger.pick
        language = challenge[:language]
        language_pronouns = pronouns.language_values[language]

        challenge[:terms].each do |term|
          expect(language_pronouns.include?(term)).to be_truthy
        end

      end
    end
  end  

end

require './lib/challenges/pt_en/nouns'
require './lib/default_random_language_service'

describe 'pt_en nouns' do

  nouns = Challenges::PtEn::Nouns.new

  context 'build challenger' do
    it 'builds a correct challenger' do
      challenger = nouns.build
      200.times do
        challenge = challenger.pick
        language = challenge[:language]
        language_nouns = nouns.language_values[language]

        challenge[:terms].each do |term|
          expect(language_nouns.values.flatten.include?(term)).to be_truthy
        end

      end
    end
  end  

end

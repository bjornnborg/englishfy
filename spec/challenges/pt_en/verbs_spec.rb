require './lib/challenges/pt_en/verbs'
require './lib/default_random_language_service'

describe 'pt_en verbs' do

  verbs = Challenges::PtEn::Verbs.new

  context 'build challenger' do
    it 'builds a correct challenger' do
      challenger = verbs.build
      200.times do
        challenge = challenger.pick
        language = challenge[:language]
        language_verbs = verbs.language_values[language]

        challenge[:terms].each do |term|
          expect(language_verbs.values.flatten.include?(term)).to be_truthy
        end

      end
    end
  end  

end

require './lib/challenges/pt_en/animals'
require './lib/default_random_language_service'

describe 'pt_en animals' do

  animals = Challenges::PtEn::Animals.new

  context 'build challenger' do
    it 'builds a correct challenger' do
      challenger = animals.build
      200.times do
        challenge = challenger.pick
        language = challenge[:language]
        language_animals = animals.language_values[language]

        challenge[:terms].each do |term|
          expect(language_animals.values.flatten.include?(term)).to be_truthy
        end

      end
    end
  end  

end

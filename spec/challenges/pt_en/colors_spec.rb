require './lib/challenges/pt_en/colors'
require './lib/default_random_language_service'

describe 'pt_en colors' do

  colors = Challenges::PtEn::Colors.new

  context 'build challenger' do
    it 'builds a correct challenger' do
      challenger = colors.build
      200.times do
        challenge = challenger.pick
        language = challenge[:language]
        language_colors = colors.language_values[language]

        challenge[:terms].each do |term|
          expect(language_colors.values.flatten.include?(term)).to be_truthy
        end

      end
    end
  end  

end

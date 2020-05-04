require './lib/default_random_language_service'

describe 'default_random_language_service' do

  lang_randomizer = DefaultRandomLanguageService.new(:portugues, :english)
  possible_langs = [:portugues, :english]

  context 'should work' do
    it 'works as expected' do
      200.times do
        lang = lang_randomizer.random_language
        expect(possible_langs.include?(lang)).to be_truthy
      end
    end
  end

end

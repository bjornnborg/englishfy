require_relative('../../simple_challenge_picker')
require_relative('../../default_random_language_service')

module Challenges
  module PtEn

    class Animals
      def initialize
        @english = {
          "horse" => ["cavalo"],
          "cat" => ["gato"],
          "dog" => ["cachorro"],
          "pig" => ["porco"],
          "duck" => ["pato"],
          "cow" => ["vaca"]
        }

        @portuguese = {
          "cavalo" => ["horse"],
          "gato" => ["cat"],
          "cachorro" => ["dog"],
          "porco" => ["pig"],
          "pato" => ["duck"],
          "vaca" => ["cow"]
        }

        @languages = [:portuguese, :english]
      end

      def build
        SimpleChallengePicker.new(@languages, [@portuguese, @english], DefaultRandomLanguageService.new(@languages.first, @languages.last))
      end

      def language_values
        {
          @languages.first => @portuguese,
          @languages.last => @english
        }
      end
    end
    
  end
end

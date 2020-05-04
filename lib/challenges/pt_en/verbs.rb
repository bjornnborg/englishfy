require_relative('../../simple_challenge_picker')
require_relative('../../default_random_language_service')

module Challenges
  module PtEn

    class Verbs
      def initialize
        @english = {
          "eat" => ["comer"],
          "drink" => ["beber"],
          "walk" => ["andar"],
          "run" => ["correr"],
          "sleep" => ["dormir"],
          "read" => ["ler"]
        }

        @portuguese = {
          "comer" => ["eat"],
          "beber" => ["drink"],
          "andar" => ["walk"],
          "correr" => ["run"],
          "dormir" => ["sleep"],
          "ler" => ["read"]
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

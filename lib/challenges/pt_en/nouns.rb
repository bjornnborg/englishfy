require_relative('../../simple_challenge_picker')
require_relative('../../default_random_language_service')

module Challenges
  module PtEn

    class Nouns
      def initialize
        @english = {
          "chair" => ["cadeira"],
          "car" => ["carro"],
          "door" => ["porta"],
          "head" => ["cabeça"],
          "bedroom" => ["quarto"],
          "table" => ["mesa"]
        }

        @portuguese = {
          "cadeira" => ["chair"],
          "carro" => ["car"],
          "porta" => ["door"],
          "cabeça" => ["head"],
          "quarto" => ["bedroom"],
          "mesa" => ["table"]
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

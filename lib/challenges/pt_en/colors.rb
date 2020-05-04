require_relative('../../simple_challenge_picker')
require_relative('../../default_random_language_service')

module Challenges
  module PtEn

    class Colors
      def initialize
        @english = {
          "red" => ["vermelho"],
          "green" => ["verde"],
          "blue" => ["azul"],
          "black" => ["preto"],
          "orange" => ["laranja"],
          "yellow" => ["amarelo"]
        }

        @portuguese = {
          "vermelho" => ["red"],
          "verde" => ["green"],
          "azul" => ["blue"],
          "preto" => ["black"],
          "laranja" => ["orange"],
          "amarelo" => ["yellow"]
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

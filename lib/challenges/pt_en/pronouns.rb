require_relative('../../simple_challenge_picker')
require_relative('../../default_random_language_service')

module Challenges
  module PtEn

    class Pronouns
      def initialize
        @english = {
          "i" => ["eu"],
          "you" => ["você", "vocês"],
          "he" => ["ele"],
          "she" => ["ela"],
          "it" => ["isso"],
          "they" => ["eles", "elas"]
        }

        @portuguese = {
          "eu" => ["i"],
          "você" => ["you"],
          "vocês" => ["you"],
          "ele" => ["he"],
          "ela" => ["she"],
          "isso" => ["it"],
          "eles" => ["they"],
          "elas" => ["they"]
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

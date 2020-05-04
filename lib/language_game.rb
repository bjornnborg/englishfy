require('./lib/challenges/pt_en/pronouns')
require_relative 'simple_answer_checker'

puts "Hi!!! Welcome to the english game"
puts "What's your name?"
name = gets.chomp

game = {
  player: name,
  questions: 0,
  correct:0,
  incorrect:0
}

pronouns = Challenges::PtEn::Pronouns.new

challengers = [
  {
    challenger: pronouns.build,
    checker: SimpleAnswerChecker.new([:portuguese, :english], [pronouns.language_values[:portuguese], pronouns.language_values[:english]])
  }
]

puts "Nice to meet you, #{name}. Let's play!!!"
value = ""

while value != "no" do
  challenger = challengers.first[:challenger]
  checker = challengers.first[:checker]

  challenge = challenger.pick
  puts ">>>>> #{challenge[:question]}"
  answer = gets.chomp
  check = checker.check(challenge, answer)

  if check
    puts "Your answer was correct!!!"
    game[:correct] = game[:correct] + 1
  else
    puts "Your answer was wrong. Try again."
    game[:incorrect] = game[:incorrect] + 1
  end

  game[:questions] = game[:questions] + 1

  puts "You scored #{game[:correct]} out of #{game[:questions]}"

  puts "Play again?"
  value = gets.chomp

end

puts "Nice to met you, #{game[:player]}"
puts "============"
puts "Game summary"
puts "============"
puts "Total questions: #{game[:questions]}"
puts "Correct questions: #{game[:correct]}"
puts "Incorrect questions: #{game[:incorrect]}"
puts ""

puts "Goodbye!!!"

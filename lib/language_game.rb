require('./lib/challenges/pt_en/pronouns')
require('./lib/challenges/pt_en/colors')
require('./lib/challenges/pt_en/animals')
require('./lib/challenges/pt_en/verbs')
require('./lib/challenges/pt_en/nouns')
require('./lib/ext/color_string')
require_relative 'simple_answer_checker'
require_relative 'randomizer'

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
colors = Challenges::PtEn::Colors.new
animals = Challenges::PtEn::Animals.new
verbs = animals = Challenges::PtEn::Verbs.new
nouns = animals = Challenges::PtEn::Nouns.new

challengers = [pronouns.build, colors.build, animals.build, verbs.build, nouns.build]

randomizer = Randomizer.new(challengers)

puts "Nice to meet you, #{name}. Let's play!!!"
value = ""

while value != "no" do
  challenger = randomizer.get

  challenge = challenger.pick
  puts ">>>>> #{challenge[:question]}"
  answer = gets.chomp
  check = challenger.check(challenge, answer)

  if check
    puts "Your answer was correct!!!".white.bold.green_background
    game[:correct] = game[:correct] + 1
  else
    puts "Your answer was wrong. Try again.".white.bold.red_background
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

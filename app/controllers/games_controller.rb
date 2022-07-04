require 'open-uri'
require 'json'
class GamesController < ApplicationController
  VOWELS = %w[A E I O U Y]
  def english
    @letters = VOWELS.sample(5)
    @letters += (('A'..'Z').to_a - VOWELS).sample(5)
    @letters.shuffle
  end

  def french
    @letters = english
  end

  def englishscore
    start_time = Time.now
    @en_word = (params[:en_word] || '').upcase
    end_time = Time.now
    final_time = end_time - start_time
    @letters = params[:letters]
    @english_word = english_word?(@en_word)
    @included = includes?(@en_word, @letters)
    @result = result(@en_word, final_time)
  end

  def frenchscore
    @letters = params[:letters]
    start_time = Time.now
    @fr_word = (params[:fr_word] || '').upcase
    end_time = Time.now
    final_time = end_time - start_time
    @result = result(@fr_word, final_time)
    @included = includes?(@fr_word, @letters)
    @french_word = french_word?(@fr_word)
  end

  private

  def includes?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    user_serialized = URI.open(url).read
    user = JSON.parse(user_serialized)
    user['found']
  end

  FRENCH = File.readlines(Rails.root + 'app/assets/images/liste_francais.txt').map(&:chomp).to_set
  def french_word?(word)
    FRENCH.include?(word.strip.downcase)
  end

  def result(attempt, time)
    if time > 60.00
      0
    else
      attempt.size * (1.0 - (time / 60.0))
    end
  end
end

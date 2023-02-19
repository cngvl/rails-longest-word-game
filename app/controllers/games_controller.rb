require 'open-uri'

class GamesController < ApplicationController
  def new
    letters
    # @letter_param = params[:@letters]
    # raise
  end

  def score
    # raise
    # letters
    @valid = check_user_input_valid?(params[:user_input], params[:letters])
    @english = user_input_english?(params[:user_input])
    # if check_user_input_valid?(params[:user_input], letters) && (user_input_english?(params[:user_input]) == 'true')
    #   'well done'
    # elsif check_user_input_valid?(params[:user_input], letters) && (user_input_english?(params[:user_input]) == 'false')
    #   'not and english word'
    # else
    #   'not in grid'
    # end
    # raise
  end

  # private

  def letters
    @letters = ('a'..'z').to_a.sample(10).join(', ')
    # @letter_param = params[:@letters]
    # @letters
  end

  def check_user_input_valid?(user_input, grid)
    user_input.chars.all? { |letter| user_input.count(letter) <= grid.count(letter) }
  end

  def user_input_english?(user_input)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{user_input}")
    json = JSON.parse(response.read)
    json['found']
  end

end

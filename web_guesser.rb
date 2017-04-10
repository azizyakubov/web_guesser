require 'sinatra'
require 'sinatra/reloader' if development?


@@number = rand(100)
@@counter = 6

def display_message(guess)
    if guess == 0
        message = ""
    elsif guess > @@number+5 
        message = "Way too high! #{@@counter} guesses left"
    elsif guess < @@number-5
        message = "Way too low! #{@@counter} guesses left"
    elsif guess < @@number
        message = "Too low! #{@@counter} guesses left"
    elsif guess > @@number
        message = "Too high! #{@@counter} guesses left"
    elsif guess == @@number
        message = "You got it right! the SECRET NUMBER is #{@@number}!"
    end
end

def check_guess(guess)
    if guess == @@number
        reset
        @announce = "You got it right! A new game has started!"
    elsif @@counter == 0
        reset
        @announce = "You lose! Generating new number for you..."
    else
        @@counter -= 1
        message = display_message(guess)
    end
end

def reset
    @@counter = 6
    @@number = rand(100)
end


get '/' do
    guess = params["guess"].to_i
    message = check_guess(guess)
    erb :index, :locals => { :message => message, :number => @@number, :counter => @@counter, :guess => guess, :announce => @announce } 
end



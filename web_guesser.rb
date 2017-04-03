require 'sinatra'
require 'sinatra/reloader'


@@number = rand(100)

def display_message(guess)
    if guess > @@number+5 
        message = "Way too high!"
    elsif guess < @@number-5
        message = "Way too low!"
    elsif guess < @@number
        message = "Too low"
    elsif guess > @@number
        message = "too high"
    elsif guess == @@number
        message = "You got it right! the SECRET NUMBER is #{@@number}"
    end
end

def check_guess(guess)
    display_message(guess)
end

get '/' do
    guess = params["guess"].to_i
    message = check_guess(guess)
    erb :index, :locals => { :message => message }
end


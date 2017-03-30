require 'sinatra'
require 'sinatra/reloader'

num = rand(100)
get '/' do
    "the SECRET NUMBER is #{num}"
end
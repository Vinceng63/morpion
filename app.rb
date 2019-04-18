require 'bundler'
require 'pry'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)

require_relative 'lib/app/boardcase'
require_relative 'lib/app/board'
require_relative 'lib/app/game'
require_relative 'lib/app/player'
#require_relative 'lib/app/application'
#require_relative 'lib/app/show'



    Game.new.go
path = File.expand_path '../../', __FILE__
PATH = path
APP = "paolap"

require "bundler/setup"
Bundler.require :default
module Utils
  def require_all(path)
    Dir.glob("#{path}/**/*.rb") do |model|
      require model
    end
  end
end
include Utils

env = ENV["RACK_ENV"] || "development"
ENV = env

# ---

require "#{path}/lib/mhash"
extend Mhash

lavori = eval File.read "#{path}/db/lavori.rb"
LAVORI = lavori.map{ |l| to_mhash l }

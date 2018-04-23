path = File.expand_path '../../', __FILE__
PATH = path
APP = "paolap"

Encoding.default_internal = Encoding::UTF_8
Encoding.default_external = Encoding::UTF_8

require "bundler"
Bundler.require :default
Haml::Filters.register_tilt_filter "Textile"

module Utils
  def require_all(path)
    Dir.glob("#{path}/**/*.rb") do |model|
      require model
    end
  end
end
include Utils

APP_ENV = ENV["RACK_ENV"] || "development"

# ---

require "#{path}/lib/mhash"
extend Mhash

lavori = eval File.read "#{path}/db/lavori.rb"
LAVORI = lavori.map{ |l| to_mhash l }

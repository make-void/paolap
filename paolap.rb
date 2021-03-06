path = File.expand_path '../', __FILE__
require "#{path}/config/env.rb"

class Paolap < Sinatra::Base

  include Voidtools::Sinatra::ViewHelpers

  if APP_ENV == "development"
    before do
      #require "#{path}/lib/mhash"
      extend Mhash
      lavori = eval File.read "#{PATH}/db/lavori.rb"
      LAVORI = lavori.map{ |l| to_mhash l }
    end
  end

  require "#{PATH}/lib/photos"
  include Photos

  get "/" do
    haml :index
  end

  get "/professione" do
    haml :professione
  end

  get "/curriculum" do
    haml :curriculum
  end

  get "/studi" do
    haml :studi
  end

  get "/lavori" do
    haml :lavori
  end

  get "/lavori/:id" do |id|
    @lavoro = LAVORI.find{ |lav| lav.id == id.to_i }
    haml :lavoro
  end

  get "/news" do
    haml :news
  end

  get "/contatti" do
    haml :contatti
  end

end

require_all "#{path}/routes"

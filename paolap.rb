path = File.expand_path '../', __FILE__
require "#{path}/config/env.rb"

class Paolap < Sinatra::Base

  include Voidtools::Sinatra::ViewHelpers

  # def photos(lavoro)
  #   []
  # end

  get "/" do
    haml :index
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
    @lavoro = LAVORI.find &:id
    haml :lavoro
  end

  get "/contatti" do
    haml :contatti
  end

end

require_all "#{path}/routes"
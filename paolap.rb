path = File.expand_path '../', __FILE__
require "#{path}/config/env.rb"

class Paolap < Sinatra::Base

  include Voidtools::Sinatra::ViewHelpers

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

  get "/contatti" do
    haml :contatti
  end

end

require_all "#{path}/routes"
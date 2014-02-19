class Paolap < Sinatra::Base
  get "/" do
    haml :index
  end
end
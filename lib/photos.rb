module Photos
  include Mhash

  def photo_count(lavoro)
    Dir.glob("#{PATH}/public/img/lavori/#{lavoro.id}/*.jpg").size
  end

  def photo_path(lavoro, photo, type=nil)
    thumbs = "thumbs/_" if type == :thumb
    "/img/lavori/#{lavoro.id}/#{thumbs}#{photo}.jpg"
  end

  def photos(lavoro)
    array = []
    1.upto(photo_count(lavoro)) do |num|
      path  = photo_path lavoro, num
      thumb = photo_path lavoro, num, :thumb
      array << { path: path, thumb: thumb }
    end
    to_mhash array
  end
end
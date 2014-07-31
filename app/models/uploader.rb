class Uploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/avatar/#{model.id}"
  end

  def default_url
    "uploads/avatar/unknown-person.jpg"
  end

end

class Uploader < CarrierWave::Uploader::Base
  storage :file

  def store_dir
    "uploads/#{model.class.name.underscore}/#{model.id}"
  end
  #
  # def filename
  #   "#{SecureRandom.base64}.#{file.extension}"
  # end
end

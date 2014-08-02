class User < ActiveRecord::Base
  has_many :projects
  has_many :commitments
  has_many :ratings

  mount_uploader :file, Uploader
end

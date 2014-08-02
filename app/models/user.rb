class User < ActiveRecord::Base
  has_many :projects


  mount_uploader :file, Uploader
end

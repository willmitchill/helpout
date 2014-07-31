class User < ActiveRecord::Base
  has_many :projects
  has_many :upvotes


  mount_uploader :file, Uploader
end

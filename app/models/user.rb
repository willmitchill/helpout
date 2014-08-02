class User < ActiveRecord::Base
  has_many :projects
  has_many :upvotes
  has_many :commitments

  mount_uploader :file, Uploader
end

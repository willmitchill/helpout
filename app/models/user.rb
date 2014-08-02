class User < ActiveRecord::Base
  has_many :projects, dependent: :destroy
  has_many :upvotes
  has_many :commitments, dependent: :destroy

  mount_uploader :file, Uploader
end

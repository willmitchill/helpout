class User < ActiveRecord::Base
  has_many :projects, dependent: :destroy

  has_many :commitments, dependent: :destroy

  has_many :ratings

  mount_uploader :file, Uploader
end

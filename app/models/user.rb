class User < ActiveRecord::Base
  has_many :projects, dependent: :destroy
  has_many :commitments, dependent: :destroy
  has_many :ratings
  # validates :first_name,:last_name, :org_name, :username, :email, :password, :file, :bio, presence: true

  mount_uploader :file, Uploader
end

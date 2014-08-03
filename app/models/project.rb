class Project < ActiveRecord::Base
  belongs_to :user
  has_many :ratings
  # validates :youtube, format: { with: /\A^http:\/\/(?:www\.)?youtube.com\/watch\?(?=[^?]*v=\w+)(?:[^\s?]+)?$\z/ }, allow_blank: true
  has_many :commitments




end

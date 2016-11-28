class Post < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  mount_base64_uploader :picture, PictureUploader

  has_many :comments
  belongs_to :category
  belongs_to :user
end

class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  mount_uploader :image, ImageUploader
end